//募集投稿削除
function confirmDestroy() {
            if(confirm("本当に削除してよろしいですか？")) {
                document.forms["recruitment_destroy"].submit();
            }
        }
//コメント削除
function confirmCommentDestroy() {
    if(confirm("本当に削除してよろしいですか？")) {
        document.forms["comment_destroy"].submit();
    }
}