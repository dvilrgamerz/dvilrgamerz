# ⚡ DVILR SPEED X v4.2

Premium browser-based internet speed and connection diagnostics.

## v4.2 stability rebuild

This release rebuilds the application interaction layer so the UI and settings are driven by a dedicated external `app.js` instead of a large inline script.

### Fixed
- Internet Health now updates after a completed test.
- Start Test is wired to one guarded test runner.
- Real-world quality cards update from measured results.
- Advanced History loads, calculates best/average/trend and stores the latest 50 results locally.
- Diagnostics Lab receives HTTPS response, packet-loss approximation, loaded latency and stability values.
- Settings opens reliably.
- Test duration 4/6/10 seconds saves immediately and is used by the next test.
- Mbps/Gbps changes immediately update displayed values and history units.
- Motion setting now actually applies: device preference, forced reduced motion, or animations on.
- Mode buttons reliably change the test button label.
- Share Result and copy/share actions are wired.
- Servers and Connection Advisor modals are wired.
- Escape and backdrop close work for the modal.
- Online/offline state updates live.
- Live graph initializes safely and resizes correctly.
- Startup no longer depends on an undefined resize function.
- Trace parsing uses a valid cross-platform newline expression.

## Features

### Speed test
- Download and upload measurements using fixed HTTPS endpoints.
- Browser-safe latency/jitter approximation.
- HTTPS packet-loss approximation.
- Live speed number, progress bar and graph.
- Configurable duration.
- Duplicate-run protection.
- Request timeouts and no stored credentials.

### Modes
- Quick
- Gaming
- Streaming
- Work
- Advanced

Modes change the testing intent and presentation. They do not claim to create separate ISP-grade infrastructure.

### Internet Health
- 0–100 score.
- Download, upload, ping, jitter, loss and stability category scores.
- Excellent / Great / Good / Fair / Poor rating.
- Gaming, streaming and video-call guidance.

### Endpoint and diagnostics
- Automatic Cloudflare edge/region detection.
- HTTPS response timing.
- Diagnostics Lab.
- Fixed endpoint architecture; arbitrary URLs are not accepted.

### History and sharing
- Local-only history, maximum 50 results.
- Best, average and trend.
- Safe DOM rendering of stored values.
- Clipboard copy and native Web Share when supported.

### Settings
- Test duration: 4 / 6 / 10 seconds.
- Speed units: Mbps / Gbps.
- Motion: device preference / reduce motion / animations on.
- Clear local history.
- Settings persist in browser localStorage.
- Changes are applied immediately where applicable and test duration is applied to the next test.

## Security

- JavaScript is now an external same-origin asset: `app.js`.
- CSP uses `script-src 'self'` instead of allowing inline JavaScript.
- Fixed HTTPS measurement endpoint only.
- No frontend API keys, passwords, database credentials or service-role secrets.
- `credentials: omit`, `cache: no-store` and `redirect: error` on measurement requests.
- AbortController request timeouts.
- Stored history is validated and rendered with DOM text APIs.
- No arbitrary user URLs.
- Security headers remain in `_headers`.

No website can honestly be guaranteed impossible to hack or completely risk-free. These controls reduce attack surface but cannot eliminate every vulnerability.

## Accuracy limitations

This is a browser measurement tool, not an ISP laboratory instrument. Browser timing is not ICMP ping; packet loss is an HTTPS approximation; Wi-Fi, cellular conditions, VPNs, device load, browser throttling, congestion and endpoint conditions can affect results.

## Privacy

No account is required. Test history and settings are stored locally in the browser. Measurement requests go only to the fixed HTTPS endpoint used by the application. See `PRIVACY.md` for the privacy notice.

## Deployment

`netlify.toml` publishes the `speed-test` directory. Deploy these files together:

```text
speed-test/
├── index.html       # UI
├── app.js           # External application engine
├── README.md        # Documentation
├── _headers        # Security headers
├── SECURITY.md      # Vulnerability reporting
├── PRIVACY.md       # Privacy notice
└── TERMS.md         # Terms and limitations
```

After deployment, use a hard refresh once so an older cached `index.html` or JavaScript file is not retained by the browser/CDN.

## Version history

### v4.2
- Rebuilt the interaction engine as `app.js`.
- Fixed all major UI controls and settings persistence.
- Fixed duration, units and motion behavior.
- Fixed graph/startup initialization.
- Tightened CSP by removing inline JavaScript.

### v4.1
- Premium network dashboard.
- Health score, endpoint diagnostics, history, sharing and troubleshooting.
