from django.contrib import admin
from django.urls import path,include

from . import views
 
urlpatterns = [
    
     
	
    #User
    path('', views.indexDashboard ,name="indexDashboard"),    
    path('login/', views.loginDashboard ,name="loginDashboard"),
    path('register/', views.registerDashboard ,name="registerDashboard"),
    path('logout/', views.logoutDashboard ,name="logoutDashboard"),

     

    #MODULE USERS
    path('users/list', views.listUserDashboard,name="listUserDashboard"),
    path('users/create', views.createUserDashboard,name="createUserDashboard"),
    path('users/view/<pk>', views.viewUserDashboard,name="viewUserDashboard"),
    path('users/update/<pk>', views.updateUserDashboard,name="updateUserDashboard"),
    path('users/delete/<pk>', views.deleteUserDashboard,name="deleteUserDashboard"),
 
    #MODULE PROJECT
    path('project/create', views.createProjectDashboard,name="createProjectDashboard"),
    path('project/view/<pk>', views.viewProjectDashboard,name="viewProjectDashboard"),
    path('project/view/<pk>/chapter/create', views.createChapterDashboard,name="createChapterDashboard"),
    path('project/view/<pk>/chapter/edit/<chapter>', views.writeChapterDashboard,name="writeChapterDashboard"),


]

