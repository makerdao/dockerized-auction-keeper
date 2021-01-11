const ethers = require('ethers');
const axios = require('axios');
const provider = ethers.getDefaultProvider();

const UNISWAP_V2_PAIR_ABI = [
    "function symbol() public view returns (string)",
    "function name() public view returns (string)",
    "function totalSupply() public view returns (uint256)",
    "function token0() public view returns (address)",
    "function token1() public view returns (address)",
    "function getReserves() public view returns (uint112, uint112, uint32)",
];
const daiEthUniPairAddress = "0xA478c2975Ab1Ea89e8196811F51A7B7Ade33eB11";
const PAIR_TOKEN = new ethers.Contract(daiEthUniPairAddress, UNISWAP_V2_PAIR_ABI, provider);

const express = require('express')
const app = express()

const wrapAsync = (fn) => {
  return (req, res, next) => {
    const fnReturn = fn(req, res, next);

    return Promise.resolve(fnReturn).catch(next);
  }
};

app.get('/univ2daieth', wrapAsync(async function (req, res) {

    try {
        const pairTokenTotalSupply = await PAIR_TOKEN.totalSupply();
        const reserves = await PAIR_TOKEN.getReserves();
        const reserve1 = reserves[1];

        const token1AmountPerPair = reserve1.mul(String(1e18)).div(pairTokenTotalSupply)

        await axios.get(
            "https://api.coingecko.com/api/v3/simple/price?ids=ethereum&vs_currencies=usd",
        ).then((result) => {
            var ethUsdPrice = result.data.ethereum.usd
            const totalDAIValue = (token1AmountPerPair / (10 ** 18)) * ethUsdPrice * 2;
            console.log("Calculated price of " + totalDAIValue + " at " + Math.round(new Date() / 1000))
            res.status(200).send({price: totalDAIValue});
        });
    } catch (e) {
        res.status(500).send({error: e});
    }
}));

app.listen(3000)
