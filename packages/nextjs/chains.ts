// ./chains.ts
import { defineChain } from "viem";

export const liskSepoliaThirdweb = defineChain({
  id: 4202, // chainId Lisk Sepolia
  name: "Lisk Sepolia",
  network: "lisk-sepolia",
  rpc: "https://rpc.sepolia-api.lisk.com",
  nativeCurrency: {
    name: "Sepolia Ether",
    symbol: "ETH",
    decimals: 18,
  },
  rpcUrls: {
    default: { http: ["https://rpc.sepolia-api.lisk.com"] },
    public: { http: ["https://rpc.sepolia-api.lisk.com"] },
  },
  blockExplorers: {
    default: { name: "Lisk Explorer", url: "https://sepolia-blockscout.lisk.com" },
  },
});
