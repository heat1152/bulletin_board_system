//ログイン、新規登録
function accountCheck(){
    var elmUserName = document.getElementById("user_name");
    var elmUserPass = document.getElementById("user_pass");
    var canSubmit = true;
    if(elmUserName.value == ""||elmUserPass == ""){
        alert("入力漏れの項目があります。");
        canSubmit = false;
    }
    return canSubmit;
}
//マイページ編集
function myPageCheck(){
    var elmUserName = document.getElementById("user_name");
    var canSubmit = true;
    if(elmUserName.value == ""){
        alert("入力漏れの項目があります。");
        canSubmit = false;
    }
    return canSubmit;
}