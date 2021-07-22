// jsが機能してるかどうか
// window.onload = function () {
//     var obj = document.getElementById("title-header");
//     obj.innerText = 'ブロック崩し(js起動中)';            //文字色を赤にする
// };

// ゲーム
var canvas = document.getElementById("myCanvas");
var ctx = canvas.getContext("2d"); // 2dグラフィックスの描画

// 初期位置
var x = canvas.width / 2;
var y = canvas.height - 30;

// 初期速度
var dx = 7
var dy = -7

// ボールの半径
var ballRadius = 10

// パドルの定義
var paddleHeight = 10
var paddleWidth = 150
var paddleX = (canvas.width/2 - paddleWidth/2)
var paddleY = (canvas.height - 20)

// パドル操作　定義
var rightPress = false
var leftPress = false

// bossサイズ
bossSize = 200

/* テスト */
var interval
function gameStart() {
    interval = setInterval(draw, 10) // 一定時間ごとに処理
}

document.getElementById("button").onclick = function() {
    if(document.getElementById("text").innerHTML == "もう一度遊ぶ") {
        document.location.reload();
    } else {
        document.getElementById("text").innerHTML = "ゲーム中";
        gameStart();
    }
  };
/* ここまで */ 

// パドル移動　反映
document.addEventListener("keydown", keyDownHandler, false)
document.addEventListener("keyup", keyUpHandler, false)


// パドルの描画
function drawPaddle() {
    ctx.beginPath();
    ctx.rect(paddleX, paddleY, paddleWidth, paddleHeight); // (左上のx座標, 左上のy座標, 幅, 高さ)
    ctx.fillStyle = "black"; // 色を決める
    ctx.fill(); //　実際に塗りつぶしをする
    ctx.closePath();
}

// ボールの描画
function drawBall() {
    ctx.beginPath();
    ctx.arc(x, y, ballRadius, 0, Math.PI * 2); // 円の描画　acr(位置x, 位置y, 半径, 始まりの角度, 終わりの角度)
    ctx.fillStyle = "red"; // 色を決める
    ctx.fill(); //　実際に塗りつぶしをする
    ctx.closePath();
}

function drawText() {
    ctx.beginPath();
    ctx.fillStyle = "red"; // 色を決める
    ctx.font = "60px 'ＭＳ ゴシック'";
    var text = "Game Over"
    var textWidth = ctx.measureText(text).width ;
    ctx.fillText(text, canvas.width/2 - textWidth/2, canvas.height/2)
    ctx.fill(); //　実際に塗りつぶしをする
    ctx.closePath();
}

// 描画
function draw() {
    // 描画リセット　
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    drawBall();
    drawPaddle();


    // boss 画像
    var boss = new Image();
    boss.src = "/assets/boss.png";  // 画像のURLを指定
    ctx.drawImage(boss, x-bossSize/2, y-bossSize/2, bossSize, bossSize);

    // リセッシュ 画像
    var clean = new Image();
    clean.src = "/assets/clean.png";  // 画像のURLを指定
    ctx.drawImage(clean, paddleX, paddleY-100, 150, 150);


    // 上にぶつかったら
    if (　y+dy < ballRadius　) {
        dy = -dy;
    } else if( y+dy > canvas.height - ballRadius - paddleHeight ) {  // 下にぶつかったら
        if( x > paddleX && x < paddleX + paddleWidth ) {
            if (y = y - paddleHeight) {
                dy = -dy;
            }
        } else {
            dx = 0
            dy = 0
            document.getElementById("text").innerHTML = "もう一度遊ぶ";
            drawText();
            clearInterval(interval); // setintervalを止めてる
            // 失敗したら
            // alert("Game Over");
            // document.location.reload();
        }
    }

    if (x+dx > canvas.width - ballRadius | x+dx < ballRadius) {
        dx = -dx;
    }

    // ボールの座標　移動
    x += dx;
    y += dy;

    // パドルの座標　移動
    if(rightPress && paddleX < canvas.width - paddleWidth) {
        paddleX += 10;
    } else if(leftPress && paddleX > 0) {
        paddleX -= 10;
    }
}

// キーを押したとき
function keyDownHandler(e) {
    if( e.key == "Right" || e.key == "ArrowRight" ) {
        rightPress = true
    } else if( e.key == "Left" || e.key == "ArrowLeft" ){
        leftPress = true
    }
}

// キーを離したとき
function keyUpHandler(e) {
    if( e.key == "Right" || e.key == "ArrowRight" ) {
        rightPress = false
    } else if( e.key == "Left" || e.key == "ArrowLeft" ){
        leftPress = false
    }
}