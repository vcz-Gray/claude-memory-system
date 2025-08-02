# Claude Memory System

## 🚀 Quick Start

### 1. Alias 설정 (권장)
```bash
# ~/.zshrc에 추가 (현재 shell: zsh)
echo 'source ~/.claude/claude-aliases.sh' >> ~/.zshrc

# 즉시 적용
source ~/.zshrc
```

### 2. 사용 가능한 명령어
- `claude-save "작업 완료"` - 체크포인트 생성
- `claude-memory` - 장기 메모리 확인
- `claude-context` - 현재 세션 상태
- `claude-checkpoints` - 저장된 체크포인트 목록
- `claude-last` - 최근 체크포인트 내용
- `claude-cd` - Claude 디렉토리로 이동
- `claude-edit` - CLAUDE.md 편집

## 📁 디렉토리 구조
```
~/.claude/
├── CLAUDE.md                  # 메인 설정 (326줄로 최적화됨)
├── claude-memory.md           # 장기 메모리
├── claude-context.md          # 세션 컨텍스트
├── claude-checkpoint-*.md     # 체크포인트 파일들
├── checkpoint.sh              # 체크포인트 스크립트
├── claude-aliases.sh          # 별칭 모음
└── claude-config/             # 분산 설정 파일
    ├── _index.md             # 구조 인덱스
    ├── mcp-toolbox.md        # MCP 도구 설정
    ├── memory-system.md      # 메모리 프로토콜
    └── graph-db-system.md    # 문서 분할 시스템
```

## 🔧 수동 체크포인트
```bash
# 중요한 작업 후
./checkpoint.sh "백엔드 API 구현 완료"

# Compact 위험 시
./checkpoint.sh "Compact 대비 백업"
```

## 🎯 자동 저장 시점
- 대화 15회 초과
- 45분 경과
- 토큰 80% 사용
- "다음에 계속", "저장해둬" 등 키워드

## 📝 메모리 관리 팁
1. 중요한 결정은 즉시 claude-memory.md에 기록
2. 세션 시작 시 claude-context.md 자동 로드
3. 체크포인트는 최근 3개만 유지 (자동 정리)

---
Created: 2025-08-02
Version: 1.0