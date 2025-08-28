# 👻고스트링 집중 도우미

![배너 이미지 또는 로고]
<img width="580" height="362" alt="스크린샷 2025-04-14 오후 9 21 40" src="https://github.com/user-attachments/assets/841c4fc0-37b1-4440-ba63-40bdd6ed9dc7" />


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

[🔗 앱스토어/웹 링크](https://apps.apple.com/kr/app/ghostring/id6747936294)


## 📆 프로젝트 기간
- 전체 기간: `2025.03 - 2025.03`
- 개발 기간: 2주


## 🛠 기술 스택

- Swift / SwiftUI / GeometryReader
- 아키텍처: MVVM
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
| 런치스크린 | 초기 화면 | <img width="1320" height="2868" alt="IMG_7450" src="https://github.com/user-attachments/assets/fd30179f-b113-46ff-b728-ac40cac97254" /> |
| 시작버튼과 팝오버 | 집중앱 수동 시작 버튼 | <img width="1320" height="2868" alt="IMG_7451" src="https://github.com/user-attachments/assets/dd60b134-60a2-4918-974c-50a0ee911723" /> |
| 집중상태 입력 전 텍스트필드 | 집중할 상태 입력 | <img width="1320" height="2868" alt="IMG_7452" src="https://github.com/user-attachments/assets/5d4164b5-fc95-44df-a69c-175442b649e6" /> |
| 입력되면 보이지않는 시스템 시간이 경과됨에 따라 효과 | 집중상태 입력 후 네온링과 파티클 상태변화, 종료는 끝내기 | <img width="1320" height="2868" alt="IMG_7453" src="https://github.com/user-attachments/assets/778e7e71-403d-43a2-9f67-aca49190dfa9" /> |
| n시간 마다 트리거 발동 | 네온링 변화 디버그 | <img width="296" height="77" alt="스크린샷 2025-04-24 오후 7 56 55" src="https://github.com/user-attachments/assets/0dee2072-981c-4abd-a171-b661d804aa92" /> |
| 활동 종료와 저장 버튼 | 저장 버튼을 눌러 내가 집중한 상태들을 기록 | <img width="1320" height="2868" alt="IMG_7454" src="https://github.com/user-attachments/assets/0de0efca-fa5c-4724-8721-c1f8c59005af" /> |
| SwiftData에 저장된 상태 기록들 | 집중상태 기록 | <img width="1320" height="2868" alt="IMG_7455" src="https://github.com/user-attachments/assets/e27df718-4a8d-4ac8-8fae-aadbe0d125d4" /> |

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
```

<img width="259" height="399" alt="스크린샷 2025-04-24 오후 5 03 51" src="https://github.com/user-attachments/assets/10bfb803-d658-4079-94b3-386961579095" />
<img width="254" height="466" alt="스크린샷 2025-04-24 오후 6 30 23" src="https://github.com/user-attachments/assets/7ace46ea-330c-46e8-b10a-834986d9458e" />


## 🧑‍💻 팀 소개

| 이름 | 역할 | GitHub |
|------|------|--------|
| Coulson | iOS Developer | [@kimminung](https://github.com/kimminung) |

![IMG_4487 복사본](https://github.com/user-attachments/assets/ba76c02f-f961-4fd5-93d1-358361a314b5)
![IMG_4476](https://github.com/user-attachments/assets/97d0d581-3559-4997-9ee2-13d173e2e655)
![IMG_4498](https://github.com/user-attachments/assets/4070bbb0-4b98-40be-a736-58e54e6db105)

<img width="1142" height="811" alt="스크린샷 2025-04-25 오후 12 23 14" src="https://github.com/user-attachments/assets/cead83a5-764a-4838-b1a6-56fb49383267" />
<img width="1080" height="696" alt="스크린샷 2025-04-24 오후 5 13 18" src="https://github.com/user-attachments/assets/fd5c325d-c767-4963-8f4e-62ee0c0dbd40" />
<img width="940" height="486" alt="스크린샷 2025-04-18 오전 12 18 43" src="https://github.com/user-attachments/assets/2cfe469b-2dc1-447f-a333-0380c2c19d5d" />
<img width="1477" height="832" alt="스크린샷 2025-04-18 오전 12 19 17" src="https://github.com/user-attachments/assets/35da963e-05b6-449d-b1fb-a6af14c8136b" />
<img width="1621" height="890" alt="스크린샷 2025-04-18 오전 12 19 37" src="https://github.com/user-attachments/assets/3dc12c16-7355-4ac7-9d32-2a62c1df76bc" />
<img width="472" height="910" alt="스크린샷 2025-04-18 오전 12 18 33" src="https://github.com/user-attachments/assets/8bd7409c-bef6-43b9-8ff6-6bf9153b405a" />


<img width="1090" height="850" alt="%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202025-04-13%20%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE%202 05 41" src="https://github.com/user-attachments/assets/0cfdd885-5c31-40aa-9947-dd374db13106" />
[🔗 피그마 링크](https://www.figma.com/design/cBztShnflZFK5gVXFBdrcQ/고링1?m=draw)

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













