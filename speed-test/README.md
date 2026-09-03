# ⚡ DVILR SPEED X v4

A premium, browser-based internet speed and diagnostics experience focused on speed, latency, stability, gaming, streaming, work, and understandable results.

> **Important:** DVILR SPEED is a browser benchmark, not a replacement for ISP-grade network instrumentation or ICMP-level measurement. Results can vary with Wi-Fi, device performance, browser behavior, server/edge distance, congestion, VPNs, and background traffic. Never present the DVILR Health Score as an industry-standard certification.

## 🚀 V4 feature set

### Test modes
- ⚡ **Quick Test** — fast everyday benchmark
- 🎮 **Gaming Test** — latency, jitter, packet-loss approximation, loaded latency, and stability
- 🎥 **Streaming Test** — 1080p, 1440p, 4K, and multi-stream suitability estimates
- 💼 **Work Test** — video calls, uploads, latency, and connection stability
- 🧪 **Advanced Test** — expanded browser diagnostics

### Professional test engine
- Download speed
- Upload speed
- Ping / HTTPS round-trip latency
- Jitter
- Packet-loss approximation
- Latency-under-load / bufferbloat-style measurement
- Connection stability
- Multi-sample measurements and trimmed latency samples
- Configurable test duration
- Live progress and live speed visualization
- Graceful failure handling when an endpoint is unavailable

### 🌎 Endpoint information
- Cloudflare edge/region detection when the browser endpoint exposes it
- Endpoint latency
- Endpoint health indicator
- Browser-safe endpoint comparison
- Server/endpoint selection UI

> Browser-only apps cannot reliably expose a complete ISP/server inventory like a dedicated native speed-test client. Endpoint labels are therefore kept honest and are not presented as a proprietary ISP network map.

### 📊 Live dashboard
- Current speed
- Average speed
- Peak speed
- Lowest observed speed
- Progress
- Live graph
- Latency graph
- Download/upload/ping/jitter cards

### 🧠 DVILR Internet Health Score
A transparent **0–100 DVILR score** combining:
- Download
- Upload
- Ping
- Jitter
- Packet-loss approximation
- Stability

The score is a product metric for easier interpretation, not a formal internet-quality standard.

### 🎮 Gaming quality
Estimates connection suitability for:
- Fortnite
- Valorant
- Call of Duty
- Cloud gaming

These are suitability estimates, not guarantees of in-game ping or matchmaking quality because actual game servers, routing, and game networking differ.

### 🎥 Streaming quality
Estimates suitability for:
- 1080p
- 1440p
- 4K
- Multiple simultaneous streams

### 💼 Work quality
Checks practical suitability for:
- Video calls
- Discord
- File uploads
- Remote-work style traffic

### 📱 Device & network diagnostics
When supported by the browser:
- Online/offline state
- Wi-Fi/cellular or browser connection type
- Effective connection type
- Browser-reported downlink estimate
- Save-Data preference
- Device/browser information

Browser APIs are optional and may be unavailable or intentionally limited by the browser.

### 📈 Advanced history
Results are stored locally in the browser and can include:
- Date/time
- Download
- Upload
- Ping
- Jitter
- Packet loss
- Loaded latency
- Health score
- Quality rating
- Stability

The app does **not** require an account for local history.

### 📤 Share results
- Share result through the browser Share API when available
- Copy result text
- Result summary card
- Download/share workflows where supported by the browser

### 🔧 Connection troubleshooting
Rule-based suggestions can identify patterns such as:
- High latency
- High jitter
- Packet loss
- Poor upload
- Unstable connection
- Potential Wi-Fi congestion

Suggestions are informational and cannot remotely repair a router, ISP connection, device, or network.

### 🧪 Diagnostics Lab
Browser-safe checks for:
- DNS/HTTPS response behavior
- Packet-loss approximation
- Loaded latency
- Stability
- Endpoint response comparison

## 🔐 Security hardening

DVILR SPEED is designed as a **static, client-side web application** with no login, database, payment system, or server-side user account in this project. That reduces attack surface, but **no website can honestly be promised to be impossible to hack**.

Security practices include:

- No passwords or API keys embedded in the frontend
- No authentication secrets stored in source code
- No server-side database exposed by this static app
- No arbitrary code execution feature
- No third-party JavaScript dependency required for the core app
- Local-only history by default
- No intentional collection of test-history data to a DVILR server
- Security-oriented HTTP headers are provided for Netlify/static hosting
- Referrer Policy limits unnecessary referrer disclosure
- Permissions Policy limits browser capabilities not needed by the app
- MIME sniffing protection is enabled through response headers
- Clickjacking protection is enabled through `frame-ancestors` / X-Frame-Options headers
- Content Security Policy is configured for the static application and its required measurement endpoints
- Cache behavior is restricted for sensitive app responses where appropriate
- External measurement requests use cache-busting and no-store behavior where supported
- The UI avoids trusting network responses as executable HTML

### ⚠️ Security limitation
A static frontend cannot protect secrets because **anything shipped to a browser is public**. Never add private API keys, passwords, database service-role keys, signing secrets, or administrator credentials to this repository.

For a future backend, use environment-managed secrets, authentication, authorization, rate limiting, input validation, logging/alerting, CSRF protections where applicable, secure cookies, dependency auditing, and server-side access controls.

The security approach is aligned with the categories emphasized by **OWASP Top 10:2025**, including broken access control, security misconfiguration, supply-chain failures, cryptographic failures, injection, insecure design, authentication failures, data integrity, logging/alerting, and exceptional-condition handling. citeturn0search3

## 🛡️ GitHub repository protection

Recommended repository settings:

1. Enable **Secret scanning**.
2. Enable **Push protection** so supported secrets are blocked before they reach the repository.
3. Review Security / Dependabot alerts regularly.
4. Use strong account security and 2FA/passkeys on the GitHub account.
5. Never bypass a real secret alert. Revoke/rotate exposed credentials immediately.
6. Keep deployment credentials outside source files.
7. Review GitHub Actions permissions before adding workflows.

GitHub documents that push protection can block supported secrets before they reach a repository, while secret scanning can detect credentials in repository history. citeturn0search0turn0search1

## ⚖️ Legal / product-safety notes

- DVILR SPEED is an independent project.
- Do not use third-party trademarks, logos, or branding in a way that implies sponsorship or affiliation.
- Product names such as games and conferencing services are used only to describe compatibility/suitability categories where shown.
- Do not claim that a test result guarantees performance in a specific game, streaming service, ISP, VPN, or application.
- Do not claim that DVILR SPEED is officially affiliated with Ookla or Speedtest.
- Do not promise that the website is invulnerable or completely free of security defects.
- If the project is commercially deployed, have the final Terms, Privacy Policy, cookie/analytics disclosures, trademark use, and jurisdiction-specific requirements reviewed by a qualified lawyer.

## 🌐 Deployment

This is a static app. Netlify can publish the `speed-test` directory directly.

Recommended production setup:

- HTTPS only
- Security headers from `_headers`
- No secrets in frontend files
- GitHub secret scanning / push protection enabled
- Minimal third-party dependencies
- Regular security reviews

## 📁 Main files

- `index.html` — DVILR SPEED X application
- `_headers` — static-host security headers
- `SECURITY.md` — vulnerability reporting guidance
- `PRIVACY.md` — privacy/product data notes
- `TERMS.md` — product terms and limitations

## 🧪 Accuracy philosophy

The goal is **useful, repeatable, understandable measurements**, not fake precision.

A browser speed test is affected by the browser, operating system, device CPU, Wi-Fi radio, router, network load, VPN/proxy, congestion, TCP/TLS/HTTP behavior, and endpoint distance. For serious network engineering, validate results with multiple tools and, when possible, measurements closer to the network edge.

## 📄 License

Add a project-specific license before distributing the software commercially or accepting outside contributions. If no license is present, normal copyright protections still apply.
