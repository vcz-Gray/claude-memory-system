# MCP Toolbox Configuration
[[../CLAUDE.md#5]] → 이 파일로 이동됨

## 5. COMPREHENSIVE MCP TOOLBOX

### Tool Mapping for Development

**Planning & Analysis:**
- sequential-thinking: Architecture, complex problems
- openmemory: Project context, decisions

**Research & Documentation:**
- brave-search: Stack Overflow, error solutions (FREE)
- fetch: Official docs, GitHub repos (FREE)
- Context7: Framework documentation
- perplexity-ask: Deep research (PAID - use sparingly)

**Implementation:**
- filesystem: Code management
- notionApi: Project documentation
- time: Timestamps, scheduling

### Cost-Effective Search Strategy
```
Level 1 (Free - Try First):
- brave-search "error" site:stackoverflow.com
- fetch official documentation URLs
- Context7 framework docs

Level 2 (Paid - Last Resort):
- perplexity-ask for:
  * Architecture best practices (10+ sources)
  * Complex performance optimization
  * Security vulnerability analysis
```

## Tool Selection Matrix

| Task Type | Primary Tool | Fallback | Cost |
|-----------|-------------|----------|------|
| Error Search | brave-search | perplexity-ask | Free → Paid |
| Docs | Context7 | fetch | Free |
| Architecture | sequential-thinking | perplexity-ask | Free → Paid |
| Memory | openmemory | claude-*.md files | Free |

## Related Links
- [[workflow-patterns.md]] - Tool combination patterns
- [[error-recovery.md]] - Tool failure handling
- [[../CLAUDE.md]] - Main configuration