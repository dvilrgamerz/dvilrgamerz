# ⚡ DVILR SPEED X v4.1

Premium browser-based internet speed and connection diagnostics.

## What v4.1 includes

### Speed testing
- Download speed measurement with live samples.
- Upload speed measurement.
- Ping/round-trip timing approximation using HTTPS requests.
- Jitter calculation from repeated browser-safe timing samples.
- Packet-loss approximation when HTTPS probes fail.
- Live speed display, progress bar and graph.
- Configurable 4/6/10 second test duration.
- Final result is calculated from measured bytes/time rather than a fake fixed number.
- Mbps and Gbps display options.
- Test state prevents duplicate simultaneous runs.
- Request timeouts and bounded browser-side work reduce runaway requests.

### Test modes
- **Quick** — fast general connection check.
- **Gaming** — emphasizes ping, jitter and loss suitability.
- **Streaming** — evaluates practical 1080p/1440p/4K readiness from measured download speed.
- **Work** — evaluates video-call/file-transfer suitability.
- **Advanced** — exposes the full diagnostics dashboard.

The mode labels change the workflow intent and result presentation; they do not magically create separate ISP-grade test infrastructure.

### Internet Health
- 0–100 health score.
- Download, upload, ping, jitter, loss and stability category scores.
- Human-readable Excellent / Great / Good / Fair / Poor rating.
- Real-world gaming, streaming and video-call guidance.

### Endpoint and diagnostics
- Automatic Cloudflare edge/region detection through the browser-safe trace endpoint.
- Endpoint response timing.
- Diagnostics Lab with HTTPS response, loaded latency, loss approximation and stability indicators.
- Server panel explains the fixed endpoint architecture instead of accepting arbitrary URLs.

### Device/network information
- Online/offline state.
- Browser Network Information API data when the browser exposes it.
- Effective connection type and estimated link speed when available.
- Save-Data preference when available.
- Platform and screen-size information.
- No raw IP address is intentionally stored by the application.

### History and sharing
- Local-only test history, capped at the most recent 50 results.
- Best, average and simple trend indicators.
- History is rendered with DOM text nodes rather than inserting stored values as executable HTML.
- Share Result modal.
- Clipboard copy when browser permission allows it.
- Native Web Share API when supported.

### Connection Advisor
- Safe troubleshooting checklist for Wi-Fi placement, heavy traffic, network equipment restart and retesting.
- Does not remotely modify routers, DNS, ISP settings or devices.

### Settings
The v4.1 Settings button is explicitly bound with `addEventListener()` and no longer uses the conflicting `settings()` function name.

Settings include:
- Test duration: 4 / 6 / 10 seconds.
- Mbps / Gbps display units.
- Motion preference.
- Clear local history.

The modal also supports Escape-to-close, backdrop close, focus return, and buttons with explicit `type="button"`.

## Security hardening

The static frontend is designed to minimize attack surface:

- No frontend API keys or service-role secrets.
- No passwords or authentication credentials.
- No database connection from the browser.
- No arbitrary user-supplied measurement URLs.
- Fixed HTTPS endpoints only.
- `cache: no-store` and `credentials: omit` for measurement requests.
- `redirect: error` for measurement fetches.
- AbortController-based request timeouts.
- No third-party JavaScript dependency.
- Local history only.
- Stored history is validated before use.
- User-controlled stored values are rendered through `textContent`/DOM APIs.
- Duplicate test execution is blocked while a test is running.
- Reduced-motion support is retained.
- Security headers are defined in `speed-test/_headers`.
- Privacy, security reporting, and product limitations are documented in separate policy files.

## HTTP security headers

`_headers` provides production-oriented controls including:

- Content-Security-Policy.
- X-Content-Type-Options: nosniff.
- X-Frame-Options: DENY.
- Strict Referrer-Policy.
- Permissions-Policy.
- HSTS.
- Cross-origin isolation-related policies.

The current single-file architecture still requires inline CSS/JavaScript, so the CSP contains an inline allowance. A future external-asset migration can tighten this further with nonces/hashes and removal of inline execution.

## Important accuracy limitations

This is a browser speed test, not an ISP laboratory instrument.

- Browser timing is not ICMP ping.
- Packet loss is an HTTPS-request approximation.
- The browser and operating system can add measurement overhead.
- Wi-Fi interference, cellular conditions, VPNs, browser throttling, device load and congestion can change results.
- Endpoint distance and server load affect measurements.
- Upload/download tests consume bandwidth while running.
- The Network Information API is optional and browser-dependent.
- A high score is an estimate of measured quality, not a guarantee of a specific gaming ping, streaming experience or ISP performance.

## Privacy

The app is intentionally static and does not require an account. Test history is stored locally in the browser. Measurement traffic goes to the fixed HTTPS test endpoints required by the app. See `PRIVACY.md` for the product privacy notice.

## Safety and legal limitations

No website can honestly be promised to be "impossible to hack," completely risk-free, or guaranteed to prevent every legal claim. Security controls reduce risk; they do not eliminate it.

The included `TERMS.md` and `PRIVACY.md` are product documentation, not legal advice and not a substitute for a qualified attorney. Before commercial launch, review applicable privacy, consumer-protection, accessibility, advertising, intellectual-property and other laws for the actual jurisdiction and business model.

## GitHub security recommendations

For a public repository, enable GitHub Secret Scanning and Push Protection where available. Do not commit API keys, passwords, private certificates, database service-role keys, session secrets or other credentials.

If a backend is added later:

1. Keep secrets server-side in environment/secret management.
2. Authenticate and authorize sensitive operations.
3. Validate every input server-side.
4. Apply rate limits and abuse controls.
5. Log security events without logging secrets or unnecessary personal data.
6. Keep dependencies patched.
7. Review CORS, CSRF, SSRF, injection and access-control risks.
8. Run automated security checks before release.

## Deployment

The app is configured for a static publish directory through the repository's Netlify configuration. Keep `_headers` deployed alongside `index.html` so the host can apply the security headers.

## Files

```text
speed-test/
├── index.html       # DVILR SPEED X v4.1 application
├── README.md        # Feature, security and accuracy documentation
├── _headers        # Production security headers
├── SECURITY.md     # Vulnerability reporting guidance
├── PRIVACY.md      # Privacy/data handling notice
└── TERMS.md        # Terms and product limitations
```

## Version history

### v4.1
- Fixed the Settings button name collision.
- Rebound all primary interactions with explicit event listeners.
- Added safer modal behavior and keyboard Escape handling.
- Hardened fetch behavior with timeouts, no-store requests, omitted credentials and redirect rejection.
- Validated and safely rendered local history.
- Improved mobile/responsive polish and focus-visible states.
- Expanded the README to document security, privacy, accuracy and legal/product limitations.

### v4
- Premium network intelligence dashboard.
- Quick/Gaming/Streaming/Work/Advanced modes.
- Health score, diagnostics, endpoint information, history and sharing.

## Responsible disclosure

See `SECURITY.md` for the project's vulnerability-reporting guidance. Do not publish secrets or sensitive vulnerability details in a public issue.
