# Claude Memory System

## 📖 Memento Pattern이란?
Claude는 대화 중 언제든 메모리가 리셋될 수 있습니다 (Compact). 
이를 대비해 중요한 정보를 지속적으로 저장하는 시스템입니다.

### 왜 필요한가?
- 💾 **Compact 대비**: 긴 대화 시 자동으로 메모리가 초기화됨
- 🔄 **세션 연속성**: 다음 대화에서 이전 작업 이어가기
- 📝 **지식 축적**: 프로젝트별 결정사항과 컨텍스트 보존

## 🚀 Quick Start

### 새 PC에서 설치 (One-liner)
```bash
# curl 사용
curl -fsSL https://raw.githubusercontent.com/vcz-Gray/claude-memory-system/main/install.sh | bash

# 또는 wget 사용
wget -qO- https://raw.githubusercontent.com/vcz-Gray/claude-memory-system/main/install.sh | bash
```

### 설치 후 Alias 활성화
설치 스크립트가 자동으로 처리하지만, 수동 설정이 필요한 경우:

```bash
# zsh 사용자
echo 'source ~/.claude/claude-aliases.sh' >> ~/.zshrc
source ~/.zshrc

# bash 사용자
echo 'source ~/.claude/claude-aliases.sh' >> ~/.bashrc
source ~/.bashrc
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

## 💡 Memento 활용 팁

### 언제 체크포인트를 만들까?
1. **중요한 작업 완료 후**
   ```bash
   claude-save "백엔드 API 구현 완료"
   ```

2. **복잡한 디버깅 중간**
   ```bash
   claude-save "메모리 누수 원인 발견"
   ```

3. **Compact 위험 신호**
   - 대화가 15회 이상 진행됨
   - 45분 이상 작업 중
   - Claude가 느려지기 시작

### 메모리 구조 이해하기
- **claude-memory.md**: 영구 기억 (프로젝트 정보, 선호 설정)
- **claude-context.md**: 현재 세션 (작업 중인 내용)
- **claude-checkpoint-*.md**: 스냅샷 (특정 시점 백업)

### 다음 세션에서 이어가기
```bash
# 1. 최근 작업 확인
claude-last

# 2. 미완료 작업 확인
grep "Unfinished" ~/.claude/claude-memory.md

# 3. Claude에게 알리기
"이전 세션의 X 작업을 이어서 진행해줘"
```

---
Created: 2025-08-02
Version: 1.1
Repository: https://github.com/vcz-Gray/claude-memory-system