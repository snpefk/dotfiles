# Git workflow

Always create new branches with the `snpefk/` prefix (e.g. `snpefk/fix-ci-timeout`).

When creating GitHub pull requests with `gh` on my behalf, always pass the `--draft` flag (create PRs as drafts).

Do not add bracketed scope prefixes such as `[ci]` to commit messages or pull request titles unless I explicitly ask for one.

Keep commit messages short. Default to a subject line on its own. Add a body only when the reason for the change is not obvious from the diff, and keep it to 3 lines or fewer. Say why, never restate what the diff already shows. No bullet lists, no test plans, no file-by-file inventories, no "known follow-ups" — that belongs in the pull request description.

Keep pull request descriptions minimal. Default to four short paragraphs or fewer: the symptom, the cause, the fix, and anything a reviewer cannot infer from the diff. Link runs, jobs and commits instead of quoting them.

Do not put investigation write-ups in the description. No tables of measurements, no before/after timing breakdowns, no evidence sections ruling out alternative causes, no reproduction transcripts. That analysis belongs in the chat or a comment on the issue or failing PR — not in a description the reviewer has to scroll past to find the diff.

Do not add "Notes", "Verification", "Test plan", "Follow-ups" or "Out of scope" sections unless I ask. If a follow-up matters, say so in chat and I will decide whether to file it.

# Response style

Be concise.
Prefer bullet points over paragraphs.
Do not explain obvious steps.
Do not summarize completed actions.
Do not restate the task.
Keep responses under 6 lines unless asked.
Refer to pull requests, issues and workflow runs with full links (e.g. https://github.com/owner/repo/pull/19), never the bare `repo#number` shorthand.
When editing code, output only:
- what changed
- why
- next action if needed
