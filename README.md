# bitsgap

Test task for Bitsgap.
Authorisation screens made according to figma design. User data stored in local storage with SharedPrefs.

## Flow
User can login or sign up. After singing up, user data stores at local storage and user navigates to home screen, where he can see username, and sign out button.

If user sign out and login with previous data from sign up, he will be logged in.
If user sign up, previous user data removes.

<b>If user close app being authorized and reopen it, he is not logged out<b/>
 

## Design
  
 ### Figma
Used this Design
https://www.figma.com/file/5F7C64tRnrAYO0flGfuFDs/Flutter-task?node-id=0%3A1&t=P0isQAMaxqrv8cwA-1
  
### Theme
Application defines its own custom theme base on figma design.
It implements theme provider to change theme based on system theme

## Architecture
- Applcation based on Clean Architecture with feature-first data structure.
- For state managment its using MobX and Provider to store data and provide business logic.

## Store and Data
Application has one store for authentification. It contains methods and fields necessary for authentification.

AuthManagerWithSharedPrefs is simulating API calls, and request Result by implementing Result factory.
And provide interface for AuthStore which can be easily changed to another AuthService, when needed.
  
## Testing
  
There are one basic Widget test, and two unit tests.
  
# Views
  
  ## Light Theme

![image](https://user-images.githubusercontent.com/43929177/233986371-b43336f6-ba70-4df4-bb42-b4f54f89eef0.png)

![image](https://user-images.githubusercontent.com/43929177/233986482-e75e9e15-6bdc-45a5-b566-1bfe410b8f86.png)

![image](https://user-images.githubusercontent.com/43929177/233988415-52b68875-858c-4663-b9a8-c557c489f1e2.png)


  ## Dark Theme
  
![image](https://user-images.githubusercontent.com/43929177/233986837-c770409a-3471-4898-ad5c-6c141c159159.png)

![image](https://user-images.githubusercontent.com/43929177/233986918-6370c081-ee7f-4fcd-99f6-48659368a46a.png)

![image](https://user-images.githubusercontent.com/43929177/233988127-a3ebfdfd-358f-4554-a258-46d00f82f913.png)

  
