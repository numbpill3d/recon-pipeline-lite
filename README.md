# recon-pipeline-lite

Lite bug bounty recon pipeline. Free version — terminal only, no fluff.

Takes a domain list, finds subs, probes live hosts, harvests JS, runs nuclei on the result.

Free on GitHub. Full methodology + 20 more scripts in the paid guide.

## Quick start

chmod +x recon-lite.sh
./recon-lite.sh targets.txt out

## What it does

1. subfinder -dL targets.txt -> subs
2. httpx -l subs -> live hosts
3. katana crawl + JS extraction
4. nuclei -l live.txt -severity medium,high,critical

## Full version

Full Bug Bounty Recon Pipeline guide ($15) on Gumroad:
https://numbpilled.gumroad.com/ — search Recon Pipeline

Built by xenotrek.
