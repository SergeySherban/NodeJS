const nodemailer = require('nodemailer');

var transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: 'sv.sherban@gmail.com',
        pass: '*******'
    }
});

var mailOptions = {
    from: 'sv.sherban@gmail.com',
    to: 'sergei_sherban@mail.ru',
    subject: 'Sending Email using Node.js',
    text: 'Test mail'
};

transporter.sendMail(mailOptions, function(error, info){
    if (error) {
        console.log(error);
    } else {
        console.log('Email sent: ' + info.response);
    }
});