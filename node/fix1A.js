var fs = require('fs');
if (process.argv.length == 3) {
    filename = process.argv[2];
    fs.readFile(filename, check4save);
}
function check4save(err, data) {
    if (data[data.length - 1] == 26) {
        fs.writeFile(filename, data.slice(0, data.length - 3), function (err) {
            if (err) throw err;
            console.log('修正完成');
        });
    }
}