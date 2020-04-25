# mac-renaming-file

macOS automatically file renaming from download directory

## 목적

맥에서 파일을 인터넷을 통해 받을 때 파일명이 깨진 경우 utf-8로 인코딩 되어 있다면 디코딩하여 파일이름을 자동으로 변경해 주는 script 입니다.

## 사용방법

### rename_utf8.sh 저장

* src/rename_utf8.sh 파일을 적당한 폴더에 저장합니다.

### apple script 만들어서 저장

* 아래 설명하는 경로에 폴더가 없다면 직접 만듭니다.

``` sh
cd ~/Library/Scripts
ls -al Folder\ Action\ Scripts

# 폴더가 없다면 생성!

mkdir Folder\ Action\ Scripts
```

* src/rename_utf8.template.applescript 파일 내용을 복사 합니다.
* applescript Editor 실행합니다.
* 해당 폴더에 원하는파일명.scpt로 저장합니다.
* 이상으로 필요한 파일은 준비가 완료되었습니다.다음부터는 Finder 앱에서 진행합니다.
* 파일이름을 자동으로 변경할 디렉토리의 설정을 변경합니다.
* 특정 디렉토리 오른쪽 마우스 클릭 > 서비스 > 폴더 적용 스크립트 설정... 

![step1](./img/step1.png 'step1')

* 서비스 실행을 클릭합니다.

![step2](./img/step2.png 'step2')

* 스크립트 편집 왼쪽에 있는 '+' 버튼을 클릭하여 본인이 저장한 apple script 파일을 선택합니다.
* 예시는 'rename_utf8.scpt' 를 선택했습니다.

![step3](./img/step3.png 'step3')

* 모든 과정이 끝났습니다.이제 인터넷에서 파일명이 깨진 파일을 다운로드 받으면 자동으로 디코딩을 해줍니다.

## 이슈 사항

### 동일한 파일명이 해당 디렉토리에 존재하는 경우

* 스크립트가 파일명을 변경할 때 기존에 파일명이 존재하는 경우 파일명 앞에 '숫자_' 를 붙여서 파일명을 변경합니다.

``` sh
%E1%84%92%E1%85%A1%E1%86%AB%E1%84%80%E1%85%B3%E1%86%AF.txt

만약 다음과 같은 파일명을 디코딩 한다면 '한글.txt' 로 변경하려고 하지만

이미 존재 하므로 '1_한글.txt'로 변경됩니다.

'1_한글.txt'도 있을 경우 '2_한글.txt'를 생성하는 방식으로 숫자가 증가합니다.

```

### utf8을 디코딩 하면서 스크립트가 한 번더 실행됩니다.

파일명이 깨진 파일의 이름을 변경하면서 새로운 파일이 해당 디렉토리에 생성된 것으로 인식해서 스크립트가 한 번 더 실행하며 utf8 디코딩 한 파일명이 동일한 경우 스크립트를 종료 하므로 무한루프에 빠지지 않습니다.

## 참조 링크

> https://apple.stackexchange.com/questions/285331/folder-automatic-action-to-rename-files-added-to-folder-with-random-names

> https://stackoverflow.com/questions/6250698/how-to-decode-url-encoded-string-in-shell

