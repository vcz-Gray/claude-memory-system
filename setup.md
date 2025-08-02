# Claude Memory System 설치 가이드

## 🚀 빠른 설치 (새 PC에서)

### One-liner 설치
```bash
curl -fsSL https://raw.githubusercontent.com/vcz-Gray/claude-memory-system/main/install.sh | bash
```

또는

```bash
wget -qO- https://raw.githubusercontent.com/vcz-Gray/claude-memory-system/main/install.sh | bash
```

### 수동 설치
```bash
# 1. 클론
git clone https://github.com/vcz-Gray/claude-memory-system.git ~/.claude

# 2. 권한 설정
chmod +x ~/.claude/checkpoint.sh

# 3. Shell 설정 (zsh 예시)
echo 'source ~/.claude/claude-aliases.sh' >> ~/.zshrc
source ~/.zshrc
```

## 🔄 기존 설정 마이그레이션

기존 PC에서 메모리를 백업하고 새 PC로 이전:

### 기존 PC에서
```bash
# 현재 상태 백업
claude-save "PC 이전 전 백업"

# 메모리 파일 압축
cd ~/.claude
tar -czf claude-backup.tar.gz claude-*.md
```

### 새 PC에서
```bash
# 1. 설치
curl -fsSL https://raw.githubusercontent.com/vcz-Gray/claude-memory-system/main/install.sh | bash

# 2. 백업 복원
cd ~/.claude
tar -xzf ~/claude-backup.tar.gz
```

## 📱 다양한 환경 지원

### Docker
```dockerfile
# Dockerfile에 추가
RUN curl -fsSL https://raw.githubusercontent.com/vcz-Gray/claude-memory-system/main/install.sh | bash
```

### WSL/Linux
```bash
# 기본 설치 스크립트 사용
curl -fsSL https://raw.githubusercontent.com/vcz-Gray/claude-memory-system/main/install.sh | bash
```

### macOS
```bash
# Homebrew가 있다면
brew install git
curl -fsSL https://raw.githubusercontent.com/vcz-Gray/claude-memory-system/main/install.sh | bash
```

## 🛠️ 커스터마이징

### 설치 경로 변경
```bash
# 다른 경로에 설치
CLAUDE_HOME="$HOME/my-claude" ./install.sh
```

### 개인 설정 추가
```bash
# ~/.claude/CLAUDE.local.md 생성
cat > ~/.claude/CLAUDE.local.md << 'EOF'
# 개인 설정
- 추가 설정 내용
EOF
```

## ⚡ 문제 해결

### Permission denied
```bash
chmod +x ~/.claude/*.sh
```

### Git이 없는 경우
```bash
# Ubuntu/Debian
sudo apt-get install git

# macOS
brew install git

# 또는 ZIP 다운로드
wget https://github.com/vcz-Gray/claude-memory-system/archive/main.zip
unzip main.zip
mv claude-memory-system-main ~/.claude
```

## 🔗 관련 링크
- GitHub: https://github.com/vcz-Gray/claude-memory-system
- Issues: https://github.com/vcz-Gray/claude-memory-system/issues