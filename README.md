# YogiYoCloneIOS 패스트 캠퍼스 팀프로젝트

<p align="center">
<img width="400" alt="7" src="https://user-images.githubusercontent.com/63357508/95486781-6ce82c00-09ce-11eb-9d6d-08bec966d3d8.jpg">
</p>


## Architecture 
- MVC


## 사용 라이브러리 
- Alamofire
- Snapkit
- Cosmos
- Kingfisher
- Firebase/Auth
- SwiftyJSON


## 소감 한마디
- 표건욱
```
백엔드 팀과 함께하는 프로젝트 방식을 경험함으로써 현업 프로젝트에서 발생하는 애로 사항과 해결 방안을 경험해 볼 수 있는 뜻깊은 시간이었습니다.
또한 개발 기간 이후 앱의 부족한 점을 공유하고 보완하는 시간을 가지며 코로나19로 인해 온라인으로 IOS 와 Backend 팀의 소통과 협업을
하는 과정은 Untact 시대에 맞는 업무방식을 직/간접적으로 경험해 볼 수 있었습니다.
프로젝트 보완 기간 동안 github 관리를 맡음으로써 각 팀원들의 다른 스타일의 코드를 이해하고 응용하는 경험을 할 수 있었습니다.
이 기간을 통해 팀원들의 pullRequests를 보며 코드 중복을 막기 위해 재사용 할 수 있도록 Code refactoring에 포인트를 두었습니다.
개인 프로젝트로는 경험할 수 없는, 협업을 통해서만 알 수 있는 좋은 경험을 느낀 시간이었습니다.
```

- 김믿음 
```
매장 리스트와 주문내역뷰를 구현하면서 백엔드 팀과 함께 REST API 를 활용하여 
실제 데이터를 네트웍을 통해 요청/응답하는것에 대한 이해를 높일수 있었다. 
그리고, 프로젝트를 진행하면서 개인적으로 뷰를 좀더 수월하게 그리는 방법을 알게 되었고, 
특히 MVC 패턴을 적용하면서 그동안 못하였던 코드의 간결화도 적용할 수 있었습니다. 
프로젝트를 진행하면서 코로나 19로 인해 온라인으로만 소통을 진행해야 해서 답답한 부분이 많았을텐데 
각자 맡은 부분 성실하게 해주어 프로젝트가 수월하게 진행됐습니다. 
```


- 김동현(팀장)
```
프로젝트 제작에 앞서 팀장으로서 GIT 관리를 시작하여 팀원들의 풀리퀘스트를 받아 컨플릭을 해소 시키며 
머지를 진행하는 과정을 경험해보며 분산 버전 관리 툴에 대한 경험을 할 수 있었습니다.
팀원의 버그 해결에 힘을 보태며 원활한 과정이 이어지게 노력하는점에 있어서 힘이 들었지만, 
제가 작성한 코드가 아닌 낯선 스타일의 코드를 읽으면서 디버깅을 하고 
구글미트로 화면을 띄어주며 해결 과정을 설명 해주는 과정은 정말 좋은 경험이었습니다.
파이어 베이스에서나 해봤을 회원 관리 프로세스를 백 엔드 팀과 협업을 진행함으로써 개인적으로 많이 성장하였다고 생각합니다. 
각 case 마다의 STATUSCODE를 백 엔드 팀에게 공유 요청하여 CLIENT에서도 
각 상황에 맞는 대응을 준비할 수 있는 최대한 RESTFUL 한 작업이 되게 노력하였고, 
또한 슬랙을 통하여 RESPONSE 받은 STATUSCODE를 가지고 SERVER ERROR와, CLIENT ERROR를 공유하면서 
즉각 대응하며 작업을 진행함으로써 협업의 묘미를 느낄수 있는 계기 되었습니다. 
정부 방침으로 인한 학원 휴강으로 인하여 오프라인 만큼의 협업 능력을 이루어내지 못한 아쉬움과 동시에 
조금더 미래지향적인 스타일의 협업이란 좋은 경험을 했다고 생각합니다.
```


- 변윤나
```
[로그인 - 주기능 - 부가기능]의 하나의 전체적인 서비스 사이클을 완성하는 앱을 개발함으로서, 
앱의 전체적인 이해와 개발환경에 대한 개념(서버관리,에러처리,데이터관리 등)을 명확히 하고 어떻게 구성하는 게 효율적인지에 대한 고민을 해볼 수 있는 좋은 경험이 었습니다.  
UI , Model(Data), REST API의 숙련이 요구되는 프로젝트였고, 
iOS동료들과 백엔드와의 장기간 팀프로젝트로 협업에 대한 경험(커뮤니케이션, 발표 준비등)이 특히 의미있었습니다.
```


<div>
  
## View
---
표건욱
## HomeVC
- 메인 홈 

- 모든 카테고리는 CustomView로 구현하여 반복사용
- 같은 View, data만 다른 카테고리에 들어오는 Data에 따라 View가 자동으로 구성되도록 구현
- 유저의 위치를 기반으로 한 서버의 추천 매장데이터를 가져와 UICollectionView 구성
- 모든 Layout은 SnapKit을 사용하여 UIScrollView의 ContentView.size가 자동으로 변경되도록 구현
- 각 item은 data를 받을 때 해당 매장, 카테고리의 id를 받아 push 할 시 다음 뷰로 id를 넘겨주어 연결

<p align="center">
<img width="200" alt="7" src="https://user-images.githubusercontent.com/62653558/97778640-de755d80-1bbb-11eb-867a-83d38561a7ec.gif">
<img width="200" alt="7" src="https://user-images.githubusercontent.com/62653558/97778683-2a280700-1bbc-11eb-99ea-b39a1a0acf6e.gif">
<img width="200" alt="7" src="https://user-images.githubusercontent.com/62653558/97778808-192bc580-1bbd-11eb-87c5-c795d88da64d.gif">
</p>

## MapVC
- 주소검색 뷰

- 상단 검색섹터는 CustomView, 하단의 최근 주소 목록과 검색 된 주소 목록은 Get 시 들어오는 data의 유, 무로 구별하여 하나의 CustomCell 내 구성 변경
- TextFieldDelegate의 ShouldReturn 실행 시 textField의 text를 keyword로 kakaoRestAPI 주소검색으로부터 해당 keyword의 주소 Get
- 각 cell은 data를 받을 때 해당 매장의 id를 받아 delegate에서 다음 뷰로 id를 넘겨주어 push 및 data 수신
- 최근 주소 리스트는 UserDefaults에 Json형태로 담겨있는 data를 CustomStruct로 JSONDecoder를 이용하여 사용
- 최근 주소 리스트 내 각 셀을 선택 시 해당 하는 주소가 homeVC의 상단 CustomTitle로 변경

<p align="center">
<img width="200" alt="7" src="https://user-images.githubusercontent.com/62653558/97778845-6d36aa00-1bbd-11eb-8977-0c103bfd321c.gif">
<img width="200" alt="7" src="https://user-images.githubusercontent.com/62653558/97778848-732c8b00-1bbd-11eb-936a-43a1b783ddde.gif">
</p>

## GoogleMapVC
- 지도 뷰

- 상단 지도는 GoogleMaps SDK를 이용, 하단의 상세주소 설정 View는 CustomView로 구현
- MapVC에서 검색한 주소 Cell을 선택 시 indexpath.row 와 같은 addressData의 index 내 lat & lon data를 GMSCameraPosition로 넘겨주도록 구현
- 현재 위치로 주소 찾기를 선택 시 push전 현재 위치를 찾고 해당 data를 GMSCameraPosition로 넘겨주도록 구현
- GMSMapViewDelegate 내 idleAt position를 이용하여 map 이동 후 GoogleMapView의 중심의 lat & lon 값을 geocoder로 주소를 구한 뒤
  하단 TextField의 text와 함께 Json형태로 UserDefaults로 저장 및 homeVC의 상단 CustomTitle로 변경

<p align="center">
<img width="200" alt="7" src="https://user-images.githubusercontent.com/62653558/97778867-90615980-1bbd-11eb-8c96-260194a27c9d.gif">
<img width="200" alt="7" src="https://user-images.githubusercontent.com/62653558/97778869-96573a80-1bbd-11eb-8580-b5c50876e4f1.gif">
</p>

## LikeVC
- 찜 뷰

- 코드 중복을 막기 위해 StoreListVC에서 사용되는 CustomCell을 재사용
- 재사용 시 다른 뷰 구성을 적용하기 위해 Cell 클래스 내에서 함수를 구성하여 들어오는 data의 조건에 맞게 구현
- 각 cell은 data를 받을 때 해당 매장의 id를 받아 delegate에서 다음 뷰로 id를 넘겨주어 push 및 data 수신

<p align="center">
<img width="200" alt="7" src="https://user-images.githubusercontent.com/62653558/97778835-4d9f8180-1bbd-11eb-906e-cd285a17706e.gif">
</p>

---
김믿음
## StoreListVC
- 카테고리별 매장 리스트 

- 사용자가 지정한 지역의 매장 데이터를 가져오는 것으로 상단 카테고리는 UISegmentControl을 Custom 하여 구현 
- 하단 페이징은 UIScrollView UITableView와 UITableViewCell 을 Customg하여 Paging 구현
- ITableViewCell 내에는 Alanofire 라이브러리를 사용하여 데이터를 GET 방식으로 Fetch

<p align="center">
<img width="200" alt="7" src="https://user-images.githubusercontent.com/61490943/95854544-1134ee80-0d92-11eb-9e28-e75be5a6a451.gif">
</p>


- 매장리스트 필터 정렬기능

- 필터 기능은 Delegate를 활용하여 UIView 로 구성, 각 필터를 누를 때마다 필터된 데이터를 받아와 TableView 가 Reload 되도록 구현 

<p align="center">
<img width="200" alt="7" src="https://user-images.githubusercontent.com/61490943/95853495-7c7dc100-0d90-11eb-86c2-846b5c157fce.gif">
</p>


## HistoryVC 

- 주문내역

- 사용자가 주문한 내역 데이터를 가져오는 화면으로 상단 카데고리는 StoreVC 와 동일하게 UISegmentControl 를 사용
- 하단 페이징 화면도 StoreVC 와 동일하게 구현하되, 데이터가 없는경우 EmptyPage를 만들어 주문하기를 클릭하면
- 매장 리스트로 갈수 있도록 구현

<p align="center">
<img width="200" alt="1" src="https://user-images.githubusercontent.com/61490943/95853729-d7afb380-0d90-11eb-8cda-abd70526b86d.gif">
</p>

---
김동현

## MenuListVC
- 매장 정보와 메뉴

- UICollectionViewFlowLayout을 custom 하여 StretchHeader를 구현
- 해당 점포의 정보와 메뉴들을 parsing하여 view 구성 
- expandable한 tableView를 사용하여 메뉴 리스트 구성

<p align="center">
<img width="200" alt="7" src="https://user-images.githubusercontent.com/63357508/95325300-f539d480-08db-11eb-8021-fd5aa8b07752.gif">
<img width="200" alt="7" src="https://user-images.githubusercontent.com/63357508/95326047-f3244580-08dc-11eb-97c8-00ae69fddc20.gif">
<img width="200" alt="7" src="https://user-images.githubusercontent.com/63357508/95326151-164ef500-08dd-11eb-86e7-db04f6a12581.gif">
</p>



## AccountVC
- 마이 요기요

- 로그인 전 메인 화면

<p align="center">
<img width="200" alt="1" src="https://user-images.githubusercontent.com/63357508/95480130-7ff6fe00-09c6-11eb-8a7e-258126dad33c.jpeg">
</p>

## SignUpVC
- 회원가입

- email, password, nickname을 PARAMETER로 추가한 후 제공된 URL로 POST 
- 서버에서 동일한 email이 사용되고 있는지 체크 
- 사용중인 이메일이 아니라면 비활성화된 유저를 서버에서 생성하고 ID, TOKEN 반환  

<p align="center">
<img width="200" alt="5" src="https://user-images.githubusercontent.com/63357508/95647347-a40f2800-0b09-11eb-86cd-f87a89ca9ca2.gif">
<img width="200" alt="1" src="https://user-images.githubusercontent.com/63357508/95647257-fbf95f00-0b08-11eb-97cc-cb3bd712a6ec.png">
</p>

## PhoneAcceptVC
- 전화번호 인증 (회원가입 완료후 바로 로그인이 되어지는 프로세스)

- FCM을 활용한 전화번호 인증을 완료후 반환받았던 ID와 유저 활성화 전용 PATH를 ENDPOINT에 추가하고 인증된 번호를 PARAMETER로 담아 PATCH
- 해당 비활성 유저의 전화번호 정보가 PATCH 되어지고 활성화 유저로 변경
- 로그인 전용 PATH를 ENDPOINT에 추가하고, 입력했던 email과 password를 PARAMETER로 담아 POST (ID, TOKEN 반환)
- 인증을 위한 해당 유저의 TOKEN을 HEADER에 담고  ID를 ENDPOINT에 추가한후 유저의 데이터를 GET한 후에
- Response의 DATA를 Codable을 채택한 구조 User 타입으로 Decode 

<p align="center">
<img width="200" alt="5" src="https://user-images.githubusercontent.com/63357508/95326699-f0762000-08dd-11eb-8236-d38c870bf649.gif">
<img width="200" alt="5" src="https://user-images.githubusercontent.com/63357508/95647260-fd2a8c00-0b08-11eb-8322-622b5a980c9a.png">
</p>

## ChangeNickNameVC
- 정보 변경

- 인증을 위한 해당 유저의 TOKEN을 HEADER에 담고 변경후에 저장될 nickname을 PARAMETER로 추가한 후 PATCH

<p align="center">
<img width="200" alt="5" src="https://user-images.githubusercontent.com/63357508/95326973-5d89b580-08de-11eb-9556-66180a25f582.gif">
<img width="200" alt="5" src="https://user-images.githubusercontent.com/63357508/95647261-fdc32280-0b08-11eb-89f0-a715923fa853.png">
</p>

## LogVC, LoggedAccountVC
- 로그인

- 입력한 email, password를 PARAMETER로 추가한 후 로그인 전용 PATH를 ENDPOINT에 추가하고 POST (ID, TOKEN 반환)
- 인증을 위한 해당 유저의 TOKEN을 HEADER에 담고  ID를 ENDPOINT에 추가한후 유저의 데이터를 GET한 후에
- Response의 DATA를 Codable을 채택한 구조 User 타입으로 Decode 

<p align="center">
<img width="200" alt="5" src="https://user-images.githubusercontent.com/63357508/95327853-a3934900-08df-11eb-8eb4-4baa8b07a058.gif">
</p>

## ProfileEditVC
- 로그아웃, 회원탈퇴

- 인증을 위한 해당 유저의 TOKEN을 HEADER에 담고 로그아웃 전용 PATH를 ENDPOINT에 추가한후 DELETE(로그 아웃)

- 인증을 위한 해당 유저의 TOKEN을 HEADER에 담고 ID를 ENDPOINT에 추가한후 DELETE(회원 탈퇴)

<p align="center">
<img width="200" alt="5" src="https://user-images.githubusercontent.com/63357508/95327497-1b14a880-08df-11eb-9306-fe001fe08a07.gif">
<img width="200" alt="5" src="https://user-images.githubusercontent.com/63357508/95328033-e9501180-08df-11eb-8723-28191f7c1703.gif">
</p>

---
변윤나

변윤나

## DetailMenuVC


- 메뉴 옵션(필/선) 및 수량선택. 결제기능

- 메뉴선택 -> 주문기능 과정에서 menuAPI를 받는 MenuData모델을 만들고 주문시 OrderData모델을 연동하여 주문데이터가 따로 관리되도록 구현(Codable)

- 주문이후 전체적인 주문정보를 관리하는 매니저(데이터 모델)인 OrderMager를 싱글톤으로 만들어 orderList 배열에 저장, 리턴, 초기화 기능을 추가하여 하위 데이터(주메뉴,옵션명,수량,totalPrice등)를 효율적으로 관리

- 옵션,필수등의 체크사항은 데이터에 따라 mandatory(true,false), name, price데이터가 변동되는 것을 고려하여 row와 section값에 직접 접근하여 처리.(필수옵션 - 단일선택, 선택옵션 - 다량선택을 위한 액션은 프로토콜로 처리)

<div>
<p align="center">
<img width="200" src="https://qussk.github.io/image/gif/yogi22.gif">
<img width="200" src="https://qussk.github.io/image/gif/yogi1.gif">
<img width="200" src="https://qussk.github.io/image/gif/yogi4.gif">
</p>
</div>

## OrderVC

- DetailMenuVC에서 선택한 데이터 내역을 받음. 수정가능.
- 모델에서 따로 연산처리함
- 유저 주소, 요청사항등 선택

<div>
<p align="center">
<img width="200" src= "https://qussk.github.io/image/gif/yogi33.gif">
<img width="200" src= "https://qussk.github.io/image/gif/yogi44.gif">
</p>
</div>



## ShareVC

- 공유하기
- 카카오SDK을 통해 id와 kakaoScheme이용헤 kakaolink처리. 
- 클립보드복사 : UIPasteboard 이용하여 처리.

<div>
<p align="center">
<img width="200" alt="2" src="https://qussk.github.io/image/gif/yogi2.gif">
<img width="200" alt="5" src="https://qussk.github.io/image/gif/yogi5.gif">
</p>
</div>



## SearchVC, DidsearchVC

- 검색기능

- 자동완성 api 

- url의 String포함을 addingPercentEncoding로 처리하여 url사용.

<div>
<p align="center">
<img width="200" src="https://qussk.github.io/image/gif/search1.gif">
<img width="200" src="https://qussk.github.io/image/gif/yogi11.gif">
</p>
</div>


---

</div>
