function test() {
var obj = document.getElementById("idname");
    obj.style.color = 'red';            //文字色を白にする
};

function test2() {
    var keyname = event.key
    var test = document.getElementById('key_test')
    // alert("Ctrl+Vが押されました")
    test.innerText += keyname
};



document.body.addEventListener('keydown', test2);

window.onload = function () {
    test();
};

document.getElementById('reset_btn').onclick = function () {
    document.getElementById('key_test').innerText = "　";
}