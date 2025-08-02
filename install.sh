#!/bin/bash
# Claude Memory System 설치 스크립트

set -e

echo "🚀 Claude Memory System 설치를 시작합니다..."

# 1. 기존 ~/.claude 백업
if [ -d "$HOME/.claude" ]; then
    echo "⚠️  기존 ~/.claude 디렉토리 발견"
    read -p "백업하고 계속하시겠습니까? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        backup_dir="$HOME/.claude.backup.$(date +%Y%m%d_%H%M%S)"
        mv "$HOME/.claude" "$backup_dir"
        echo "✅ 백업 완료: $backup_dir"
    else
        echo "❌ 설치 취소"
        exit 1
    fi
fi

# 2. 레포지토리 클론
echo "📥 GitHub에서 다운로드 중..."
git clone https://github.com/vcz-Gray/claude-memory-system.git "$HOME/.claude"

# 3. 실행 권한 설정
chmod +x "$HOME/.claude/checkpoint.sh"

# 4. Shell 감지 및 설정
if [ -n "$ZSH_VERSION" ]; then
    SHELL_RC="$HOME/.zshrc"
    SHELL_NAME="zsh"
elif [ -n "$BASH_VERSION" ]; then
    SHELL_RC="$HOME/.bashrc"
    SHELL_NAME="bash"
else
    echo "⚠️  지원하지 않는 shell입니다. 수동으로 설정해주세요."
    SHELL_RC=""
fi

# 5. Shell 설정 추가
if [ -n "$SHELL_RC" ]; then
    if ! grep -q "claude-aliases.sh" "$SHELL_RC"; then
        echo "" >> "$SHELL_RC"
        echo "# Claude Memory System" >> "$SHELL_RC"
        echo "source ~/.claude/claude-aliases.sh" >> "$SHELL_RC"
        echo "✅ $SHELL_NAME 설정 완료 ($SHELL_RC)"
        
        # 현재 shell에도 즉시 로드
        source "$HOME/.claude/claude-aliases.sh"
    else
        echo "ℹ️  이미 설정되어 있습니다"
        source "$HOME/.claude/claude-aliases.sh"
    fi
else
    echo "⚠️  수동 설정 필요:"
    echo "   echo 'source ~/.claude/claude-aliases.sh' >> ~/.bashrc"
    echo "   source ~/.bashrc"
fi

# 6. 기본 메모리 파일 생성
if [ ! -f "$HOME/.claude/claude-memory.md" ]; then
    echo "📝 기본 메모리 파일 생성 중..."
    cat > "$HOME/.claude/claude-memory.md" << 'EOF'
# Claude Long-term Memory
Last Updated: $(date +%Y-%m-%dT%H:%M:%S%z)

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

## Critical Decisions Log

## Unfinished Business

## Knowledge Base
EOF
fi

# 7. 컨텍스트 파일 생성
cat > "$HOME/.claude/claude-context.md" << EOF
# Claude Session Context
Session ID: install-$(date +%Y%m%d-%H%M%S)
Started: $(date +%Y-%m-%dT%H:%M:%S%z)
Last Active: $(date +%Y-%m-%dT%H:%M:%S%z)

## Current State
- Working Directory: $PWD
- Active Task: 초기 설치
- Session Status: 새 설치

## Recent Actions
- [$(date +%H:%M)] Claude Memory System 설치 완료

## Session Variables

## Conversation Metrics
- Turns: 0
- Est. Tokens: 0
- Compact Risk: LOW
EOF

echo ""
echo "✨ 설치 완료!"
echo ""
echo "🎯 다음 명령어를 실행하여 즉시 사용할 수 있습니다:"
echo "   source $SHELL_RC"
echo ""
echo "📚 사용 가능한 명령어:"
echo "   claude-save \"작업 내용\"  - 체크포인트 생성"
echo "   claude-memory           - 장기 메모리 확인"
echo "   claude-context          - 현재 세션 확인"
echo "   claude-last             - 최근 체크포인트"
echo ""
echo "💡 자세한 내용은 ~/.claude/README.md 참조"