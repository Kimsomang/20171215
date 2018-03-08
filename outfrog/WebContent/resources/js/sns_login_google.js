var GoogleApp = {
     auth2: {},
     // �ʱ�ȭ
     init: function() {
          gapi.load('auth2', function() {
               GoogleApp.auth2 = gapi.auth2.init({
                    client_id: '681233290556-12tje1cohcnter91s125viaukgi2ht5p.apps.googleusercontent.com',
                    cookiepolicy: 'single_host_origin',
               });
 
               // Ư�� ��忡 ���� �α��� ��ư ����
               GoogleApp.attachSignin(document.getElementById('google_join_btn'));
          });
     },
     // Ư�� ��忡 ���� �α��� ����
     attachSignin: function(element) {
          // ��ư ���, ?, �α��� ������ �ݹ��Լ�, �α��� ���н� �ݹ��Լ�
          GoogleApp.auth2.attachClickHandler(element, {}, GoogleApp.signinCallback, GoogleApp.signinFailure);
     },
     // �α��� ������ �ݹ��Լ�
     signinCallback: function(googleUser) {
          var id = googleUser.getBasicProfile().getId();
          var memberName = googleUser.getBasicProfile().getName();
          var email = googleUser.getBasicProfile().getEmail();
          var token = googleUser.getAuthResponse().access_token;
 
          // ������ �ڵ�
     },
     // �α��� ���н� �ݹ��Լ�
     signinFailure: function(error) {
          console.log(JSON.stringify(error, undefined, 2));
     }
};
// �ʱ�ȭ ����
GoogleApp.init();


