from django.urls import path
from . import views

app_name = 'blog'

# /blog/ 뒤에 생성
urlpatterns = [
    # path(패턴, 매핑) /blog/
    # path("", views.index), # FBV 방법
    # 글 목록 조회
    path("", views.List.as_view(), name='list'), # /blog/
    # 글 상세 조회
    path("detail/<int:pk>/", views.Detail.as_view(), name='detail'),
    # 글 작성
    path("write/", views.Write.as_view(), name='write'), # /blog/write/
    # 글 수정
    # 글 삭제
    # 코멘트 작성
    # 코멘트 삭제
]