# 웹툰앱 개발과정 

## 위젯
- 위젯은 <b>Key</b>라는 것을 가지고 있고, 이를 ID처럼 사용한다. 
- 화면의 기본 폼은 Scafford를 사용하여 구현한다.
- Appbar
    - Appbar는 기본적으로 음영을 가짐 
    <br> => 이를 줄이거나 늘이려면 <b>elevation 옵션 이용!</b>

## 데이터 가져오기
> API에게 데이터를 요청하고 받아오는 과정 

- http라는 라이브러리를 사용해야함. 
- 라이브러리 설치 관련 문서를 찾기 위해선, https://pub.dev 로 가면 됨.
- http 라이브러리
    - http 요청을 사용하는데 필요한 라이브러리.
    - 설치 방법
        - 1. cmd 라인을 이용하여 설치하기
        - 2. pubspec.yaml 파일의 dependencies 부분에 추가하기.
        <br>=> 이후에 vscode의 extension 에서 다운로드 모양 버튼을 클릭하여 모든 패키지를 설치함.
        <br>=> 저장만 해도 자동으로 설치해줌.!!
    - 사용 방법
        - get 메소드 불러오기 
        (불러오면 자동으로 패키지가 import 됨. )
        - get요청 시 반환 타입이 Future임.
        - Future는 무엇인가?
            - 미래에 받을 값의 타입을 알려줌.
            - 응답이 반환될 때 까지 기다림. 
            - 비동기 처리 방법
        - 응답은 보통 JSON으로 오기에, JsonDecode 함수로 각각을 처리해주면 좋음.

## 데이터 로딩 화면
- FutureBuilder를 사용하면, Stateless Widget에서 비동기 처리된 데이터로 UI 업데이트가 가능하다.
- 다양한 아이템을 로드하는 방벙
    - ListView.builder를 이용하여 나열하기.
    - ListView.builder
        - 아이템을 로딩할때 한번에 다 로딩하지 않고, 화면에 보이는 만큼만 서버에서 로딩한다. 
    - ListView.separated
        - 아이템을 로딩하고 화면에 표시할 때, separatorBuilder에 정한 너비만큼 띄워서 화면에 표시한다.
- 개발과정 : 코드를 작성한 후, 위젯이 커지면 분리하는 형식으로 진행. 