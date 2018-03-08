var FaceBookApp = {
     FBScopes: {scope: 'public_profile,email'},
     accessToken: '',
     // �ʱ�ȭ �Լ�
     init: function(d, s, id) {
          window.fbAsyncInit = function() {
               FB.init({
                    appId : '681233290556-12tje1cohcnter91s125viaukgi2ht5p.apps.googleusercontent.com',
                    xfbml : true,
                    version : 'v2.6'
               });
          };
 
          var js, fjs = d.getElementsByTagName(s)[0];
          if (d.getElementById(id)) {return;}
          js = d.createElement(s); js.id = id;
          js.src = "//connect.facebook.net/en_US/sdk.js";
          fjs.parentNode.insertBefore(js, fjs);
     },
     statusChangeCallback: function(response) {
          FaceBookApp.accessToken = response.authResponse.accessToken;
 
          // ���� ����
          if (response.status === 'connected') {
               // ���� ������ ������ �ڵ�
               FaceBookApp.FBsigninCallback();
          // ���� �ź�
          } else if (response.status === 'not_authorized') {
               console.log('Please log into this app.');
          // �� ��..
          } else {
               console.log('Please log into Facebook.');
          }
     },
     FBsigninCallback: function() {
          FB.api('/me?fields=id,email,name', function(response) {
               var id = response.id;
               var token = FaceBookApp.accessToken;
               var memberName = response.name;
               var email = response.email;
 
               // ������ �ڵ�
 
          });
     }
};
// �ʱ�ȭ ����
FaceBookApp.init(document, 'script', 'facebook-jssdk');
