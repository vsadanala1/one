<!DOCTYPE html>
<html>
<head>
    <title>Password Generator</title>
    <style>
        body {
            font-family: Arial;
            background:#f6f9fc;
            text-align:center;
            padding:40px;
        }
        .box {
            width:500px;
            background:#fff;
            margin:auto;
            padding:30px;
            border-radius:18px;
            box-shadow:0 4px 20px rgba(0,0,0,0.1);
        }
        input[type="text"] {
            width:80%;
            padding:12px;
            border-radius:12px;
            border:1px solid #ccc;
            font-size:18px;
        }
        button {
            padding:12px 25px;
            background:#007bff;
            color:white;
            border:none;
            border-radius:25px;
            font-size:18px;
            cursor:pointer;
        }
        .row { 
            margin-top:20px; 
            font-size:18px;
        }
    </style>
</head>

<body>

<h1>Random Password Generator</h1>

<div class="box">

    <input id="result" type="text" readonly>
    <button onclick="copy()">Copy</button>

    <div class="row">
        Password length: <span id="lenValue">12</span>
        <br><br>
        <input id="length" type="range" min="6" max="30" value="12" 
               oninput="document.getElementById('lenValue').innerText = this.value">
    </div>

    <div class="row">
        <label><input type="checkbox" id="upper" checked> ABC</label>
        <label><input type="checkbox" id="lower" checked> abc</label>
        <label><input type="checkbox" id="digits" checked> 123</label>
        <label><input type="checkbox" id="special" checked> #$%</label>
    </div>

    <button onclick="generate()">Generate</button>

</div>

<script>
function generate() {
    let data = {
        length: document.getElementById("length").value,
        upper: document.getElementById("upper").checked,
        lower: document.getElementById("lower").checked,
        digits: document.getElementById("digits").checked,
        special: document.getElementById("special").checked
    };

    fetch("/generate", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(data)
    })
    .then(res => res.json())
    .then(out => {
        document.getElementById("result").value = out.password;
    });
}

function copy() {
    navigator.clipboard.writeText(
        document.getElementById("result").value
    );
    alert("Copied!");
}
</script>

</body>
</html>
