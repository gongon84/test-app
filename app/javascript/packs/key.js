// jsが機能してるかどうか
window.onload = function () {
    var obj = document.getElementById("idname");
    obj.style.color = 'red';            //文字色を赤にする
};

function test2() {
    var keyname = event.key
    var test = document.getElementById('key_test')
    var problem_ro = document.getElementById('problem_ro')
    var problem_ja = document.getElementById('problem_ja')
    var judge = document.getElementById('judge')
    if (keyname === 'Enter') {
        if (test.innerText === problem_ro.innerText) {
            var rand = Math.floor(Math.random()*gon.problem_ja.length)
            problem_ja.innerText = gon.problem_ja[rand]
            problem_ro.innerText = gon.problem_ro[rand]
            test.innerText = ""
            judge.innerText = "正解"
            judge.style.color = 'red'
        } else {
            test.innerText = ""
            judge.innerText = "不正解"
            judge.style.color = 'blue'
        }
    } else if (keyname === 'Backspace') {
        test.innerText = test.innerText.slice(0, -1);
    } else {
        test.innerText += keyname
        judge.innerText = ""
    }
};


document.body.addEventListener('keydown', test2);


document.getElementById('reset_btn').onclick = function () {
    document.getElementById('key_test').innerText = "";
}