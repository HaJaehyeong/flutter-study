## React - Flutter 용어 비교 설명

| Flutter 용어          | React 용어                                       | 설명                                           |
| --------------------- | ------------------------------------------------ | ---------------------------------------------- |
| Widget                | Component                                        | UI를 구성하는 기본 단위                        |
| StatelessWidget       | Function Component (with no state)               | 상태 없는 정적인 컴포넌트                      |
| StatefulWidget        | Function Component + useState or Class Component | 상태가 있는 컴포넌트                           |
| BuildContext          | props / context API                              | 상위 트리에서 전달된 정보 접근                 |
| setState()            | setState / useState                              | 상태 변경 후 리렌더링                          |
| Navigator.push()      | navigate('/path')                                | 새로운 화면으로 이동                           |
| Navigator.pop()       | history.back()                                   | 이전 화면으로 돌아가기                         |
| Scaffold              | Layout (전체 페이지 틀)                          | AppBar, Body, FAB 등을 포함한 페이지 기본 구조 |
| MaterialApp           | App Root / Provider Wrapper                      | 앱 전체 설정 (테마, 라우팅 등)                 |
| ThemeData             | ThemeProvider or CSS                             | 앱 전반적인 스타일 테마 지정                   |
| initState()           | useEffect(() => {}, [])                          | 컴포넌트 처음 마운트될 때 실행되는 코드        |
| dispose()             | useEffect(() => return fn, [])                   | 컴포넌트가 언마운트될 때 실행되는 정리 코드    |
| setState(() {})       | setState(prev => ...)                            | 현재 상태를 기반으로 상태 갱신                 |
| Provider, Riverpod 등 | Context API, Redux, Jotai 등                     | 상태 관리 툴                                   |
