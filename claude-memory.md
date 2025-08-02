# Claude Long-term Memory
Last Updated: 2025-08-02T11:50:00+09:00

## Project Context
- Main Goal: [프로젝트별로 업데이트]
- Architecture: [주요 결정사항 기록]
- Stack: [사용 중인 기술 스택]

## User Preferences
- Coding Style: 
  - 간결한 코드 선호
  - 불필요한 주석 제거
  - 명확한 변수명 사용
- Favorite Tools: 
  - VS Code
  - Claude Code
  - Git
- Communication:
  - 한국어 설명 (개발 용어는 영어)
  - 작업 전 계획 설명 필수
  - 토큰 효율성 중시

## Critical Decisions Log
- [2025-08-02] Memento 시스템 도입: Compact 대비 자동 메모리 관리
- [2025-08-02] Graph DB 문서 구조: 500줄 초과 시 자동 분할

## Unfinished Business
- [✓] claude-config 디렉토리 생성 및 파일 분할 (완료: 2025-08-02)
- [ ] 자동 체크포인트 시스템 스크립트 구현 (Priority: MEDIUM)
- [ ] 나머지 CLAUDE.md 섹션 분할 (Priority: LOW)

## Knowledge Base
- Session Limits: 5시간 세션, 일일 제한은 비용/가중치 기반
- Compact Timing: 대화 15회 또는 45분 경과 시
- Opus vs Sonnet: Opus가 약 5배 비용/가중치