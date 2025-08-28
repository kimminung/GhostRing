# 👻고스트링 집중 도우미

![배너 이미지 또는 로고](링크)

> 간단한 한 줄 소개 – 프로젝트의 핵심 가치 또는 기능

[![Swift](https://img.shields.io/badge/Swift-5.9-orange.svg)]()
[![Xcode](https://img.shields.io/badge/Xcode-16.4-blue.svg)]()
[![License](https://img.shields.io/badge/license-MIT-green.svg)]()

---
----
## 🗂 목차
- [소개](#소개)
- [프로젝트 기간](#프로젝트-기간)
- [기술 스택](#기술-스택)
- [기능](#기능)
- [시연](#시연)
- [폴더 구조](#폴더-구조)
- [팀 소개](#팀-소개)
- [Git 컨벤션](#git-컨벤션)
- [테스트 방법](#테스트-방법)
- [프로젝트 문서](#프로젝트-문서)
- [라이선스](#lock_with_ink_pen-license)

---

## 📱 소개

> 집중하고있는 작업 상태를 나타내고, 나만의 시간을 갖는다

[🔗 앱스토어/웹 링크](https://example.com)


## 📆 프로젝트 기간
- 전체 기간: `2025.0 - 2025.0`
- 개발 기간: `2025.0 - 2025.0`


## 🛠 기술 스택

- Swift / SwiftUI / 
- 아키텍처: MVVM / 
- 기타 도구: Figma / GitHub Projects


## 🌟 주요 기능

- ✅ 런치스크린
- ✅ 시작 버튼과 팝오버
- ✅ 작업상태 입력뷰
- ✅ 작업명입력 후 파티클과 네온링
- ✅ 결과 화면 - SwiftData에 저장

> 필요시 이미지, GIF, 혹은 링크 삽입


## 🖼 화면 구성 및 시연

| 기능 | 설명 | 이미지 |
|------|------|--------|
| 예시1 | 기능 요약 | ![gif](링크) |
| 예시2 | 기능 요약 | ![gif](링크) |
<img width="1320" height="2868" alt="IMG_7450" src="https://github.com/user-attachments/assets/fd30179f-b113-46ff-b728-ac40cac97254" />

<img width="1320" height="2868" alt="IMG_7451" src="https://github.com/user-attachments/assets/dd60b134-60a2-4918-974c-50a0ee911723" />

<img width="1320" height="2868" alt="IMG_7452" src="https://github.com/user-attachments/assets/5d4164b5-fc95-44df-a69c-175442b649e6" />

<img width="1320" height="2868" alt="IMG_7453" src="https://github.com/user-attachments/assets/778e7e71-403d-43a2-9f67-aca49190dfa9" />

<img width="1320" height="2868" alt="IMG_7454" src="https://github.com/user-attachments/assets/0de0efca-fa5c-4724-8721-c1f8c59005af" />

<img width="1320" height="2868" alt="IMG_7455" src="https://github.com/user-attachments/assets/e27df718-4a8d-4ac8-8fae-aadbe0d125d4" />

## 🧱 폴더 구조

```
📦── GhostRing
│   📂── Components
│   │   ├── GRFocusRow.swift
│   │   ├── GRNeonRingView.swift
│   │   ├── GRParticleView.swift
│   │   └── GRPopOver.swift
│   ├── ContentView.swift
│   ├── GhostRingApp.swift
│   📂── Models
│   │   └── GRModel.swift
│   📂── Resources
│   │   ├── Assets.xcassets
│   │   │   ├── AccentColor.colorset
│   │   │   │   └── Contents.json
│   │   │   ├── AppIcon.appiconset
│   │   │   │   ├── Contents.json
│   │   │   │   ├── GhostMainImageFinal 1.png
│   │   │   │   ├── GhostMainImageFinal 2.png
│   │   │   │   └── GhostMainImageFinal.png
│   │   │   ├── Contents.json
│   │   │   └── GhostMainImage.imageset
│   │   │       ├── Contents.json
│   │   │       └── GhostMainImage.png
│   │   └── GRLaunchScreenView.swift
│   📂── ViewModels
│   │   ├── GRNavigationManager.swift
│   │   └── GRSessionManager.swift
│   📂── Views
│       ├── GRActivityListView.swift
│       ├── GRConcentrationView.swift
│       ├── GRStartView.swift
│       └── GRSummaryView.swift
├── GhostRing.xcodeproj
│   ├── project.pbxproj
│   ├── project.xcworkspace
│   │   ├── contents.xcworkspacedata
│   │   ├── xcshareddata
│   │   │   └── swiftpm
│   │   │       └── configuration
│   │   └── xcuserdata
│   │       └── coulson.xcuserdatad
│   │           └── UserInterfaceState.xcuserstate
│   └── xcuserdata
│       └── coulson.xcuserdatad
│           ├── xcdebugger
│           │   └── Breakpoints_v2.xcbkptlist
│           └── xcschemes
│               └── xcschememanagement.plist
└── README.md

📦ProjectName
┣ 📂Feature
┃ ┣ 📂SceneA
┃ ┗ 📂SceneB
┣ 📂Core
┣ 📂UI
┣ 📂Test
┗ 📂Resources
```


## 🧑‍💻 팀 소개

| 이름 | 역할 | GitHub |
|------|------|--------|
| 홍길동 | iOS Developer | [@hong](https://github.com/hong) |
| 김개발 | PM | [@devkim](https://github.com/devkim) |

[🔗 팀 블로그 / 미디엄 링크](https://medium.com/example)

## 🔖 브랜치 전략
`(예시)`
- `main`: 배포 가능한 안정 버전
- `develop`: 통합 개발 브랜치
- `feature/*`: 기능 개발 브랜치
- `bugfix/*`: 버그 수정 브랜치
- `hotfix/*`: 긴급 수정 브랜치

## 🌀 커밋 메시지 컨벤션
`(예시)`  
[Gitmoji](https://gitmoji.dev) + [Conventional Commits](https://www.conventionalcommits.org)

### 예시
- ✨ feat: 로그인 화면 추가
- 🐛 fix: 홈 진입 시 크래시 수정
- ♻️ refactor: 데이터 모델 구조 정리


## ✅ 테스트 방법

1. 이 저장소를 클론합니다.
```bash
git clone https://github.com/yourteam/project.git
```
2. `Xcode`로 `.xcodeproj` 또는 `.xcworkspace` 열기
3. 시뮬레이터 환경 설정: iPhone 15 / iOS 17
4. `Cmd + R`로 실행 / `Cmd + U`로 테스트 실행


## 📎 프로젝트 문서

- [기획 히스토리](링크)
- [디자인 히스토리](링크)
- [기술 문서 (아키텍처 등)](링크)


## 📝 License

This project is licensed under the ~~[CHOOSE A LICENSE](https://choosealicense.com). and update this line~~
