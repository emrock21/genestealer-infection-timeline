# Genestealer Infection Timeline – Warhammer 40K On‑Chain Log

This repository contains a fully on‑chain historical log of Genestealer infection reports, inspired by the Warhammer 40,000 universe.

Each interaction with the contract records a new entry in the infection timeline, including:

- Sector or location  
- Type of sighting  
- Threat level  
- Reporting address  
- Timestamp  

All reports are stored permanently on‑chain.

---

## Contract Address and Verification

The contract is deployed and verified on BaseScan:

**https://basescan.org/address/0x86b2badca3e04f0160d388590aab3412a393e79e#code**

Anyone can:

- Inspect the source code  
- Read the full list of infection reports  
- Call the `reportInfection` function to add new entries  
- Track events emitted for each report  

---

## Contract Overview

The main contract is `GenestealerInfectionTimeline.sol`.

It provides:

- A public array `reports` of `InfectionReport` structs  
- A function `reportInfection(string sector, string sightingType, string threatLevel)`  
- A function `totalReports()` to get the total number of entries  
- An event `InfectionReported` emitted on each new report  

Each `InfectionReport` contains:

- `sector` – sector or location of the sighting  
- `sightingType` – type of Genestealer activity  
- `threatLevel` – severity of the threat  
- `reportedBy` – address that submitted the report  
- `timestamp` – block timestamp of the report  

There is also a text size limit per field to prevent excessively large inputs.

---

## Safety

This contract is intentionally designed to be simple and safe for public interaction:

- No `payable` functions  
- No ETH transfers  
- No external calls  
- No `selfdestruct`  
- No ownership or admin logic  
- No token or financial logic  

It is purely a data‑logging contract for lore and experimentation.

---

## How to Use (Remix)

1. Open Remix: https://remix.ethereum.org  
2. Create a file named `GenestealerInfectionTimeline.sol`  
3. Paste the contract code from `contracts/GenestealerInfectionTimeline.sol`  
4. Compile with Solidity **0.8.31**  
5. Deploy using MetaMask or Remix VM  
6. Interact with:

   - `reportInfection("Helios Gamma", "Genestealer cult activity", "Confirmed")`  
   - `totalReports()`  
   - `reports(0)` to read the first report  

---

## Purpose

This project is meant as:

- A thematic Warhammer 40K on‑chain log  
- A learning tool for historical state recording in Solidity  
- A fun, non‑financial experiment in public, immutable data

---

## License

This project is released under the MIT License.
