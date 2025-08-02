# Memento Context Management Protocol
[[../CLAUDE.md#15]] → 이 파일로 이동됨

## 15. MEMENTO CONTEXT MANAGEMENT PROTOCOL

### Core Philosophy: "나의 기억은 언제든 리셋될 수 있다"
매 대화가 마지막일 수 있다고 가정하고, 중요한 정보를 즉시 기록합니다.

### Memory File Structure
```
~/.claude/
├── CLAUDE.md                    # 메인 설정 (이 파일)
├── claude-memory.md             # 영구 기억 저장소
├── claude-context.md            # 현재 세션 컨텍스트
├── claude-checkpoint-*.md       # 자동 체크포인트
└── claude-config/               # 분산 설정 파일 (Graph DB)
    ├── _index.md               # 설정 파일 인덱스
    ├── memory-system.md        # [[CLAUDE.md#15]]
    ├── tool-mapping.md         # [[CLAUDE.md#5]]
    └── workflow-patterns.md    # [[CLAUDE.md#12]]
```

### Automatic Memory Protocol

**1. 모든 대화 시작 시**
```python
# 자동 실행
1. if exists('~/.claude/claude-memory.md'):
      load_long_term_memory()
2. if exists('~/.claude/claude-context.md') and recent(5_minutes):
      restore_session_context()
3. display_unfinished_business()
```

**2. Compact 감지 및 저장**
```python
# 자동 트리거 조건
if any([
    conversation_turn > 15,
    elapsed_time > 45_minutes,
    token_usage > estimated_80_percent,
    user_says("다음에 계속", "저장해둬", "기억해")
]):
    save_memory_checkpoint()
```

**3. Memory CRUD Commands**
```bash
# 사용자 명령어
"memory show"           # 현재 메모리 상태 표시
"memory save [reason]"  # 강제 체크포인트 생성
"memory load [file]"    # 특정 체크포인트 복원
"memory clear context"  # 단기 메모리만 초기화
"memory edit"          # 메모리 파일 편집
```

### Memory File Templates

**claude-memory.md (Long-term)**
```markdown
# Claude Long-term Memory
Last Updated: {{timestamp}}

## Project Context
- Main Goal: [핵심 목표]
- Architecture: [주요 결정사항]
- Stack: [기술 스택]

## User Preferences
- Coding Style: [예시 포함]
- Favorite Tools: [도구 목록]
- Pet Peeves: [싫어하는 것들]

## Critical Decisions Log
- [날짜] 결정: [내용] 이유: [근거]

## Unfinished Business
- [ ] Task 1 (Priority: HIGH) - [상세 설명]
- [ ] Task 2 (Priority: MEDIUM) - [다음 단계]

## Knowledge Base
- Common Errors: [해결법 포함]
- Useful Commands: [자주 쓰는 명령어]
```

**claude-context.md (Session)**
```markdown
# Claude Session Context
Session ID: {{uuid}}
Started: {{start_time}}
Last Active: {{current_time}}

## Current State
- Working Directory: {{pwd}}
- Active Files: [열린 파일들]
- Git Branch: {{branch}}
- Running Services: [포트 정보]

## Recent Actions
- [시간] Action: Result
- [시간] File Modified: Changes

## Session Variables
- KEY=value
- Important Paths: [경로들]

## Conversation Metrics
- Turns: {{count}}
- Est. Tokens: {{estimate}}
- Compact Risk: {{percentage}}%
```

### Checkpoint Strategy

**자동 체크포인트 생성 시점:**
1. 중요한 작업 완료 (마일스톤)
2. 복잡한 디버깅 세션 중간
3. 아키텍처 결정 직후
4. Compact 10분 전 경고

**체크포인트 포함 내용:**
- 현재 작업 상태 스냅샷
- 실행 중인 모든 프로세스
- 열린 파일들과 수정 내역
- 다음 단계 명확한 지시

## Related Links
- [[../claude-memory.md]] - Long-term memory
- [[../claude-context.md]] - Session context
- [[graph-db-system.md]] - Document organization
- [[../CLAUDE.md]] - Main configuration