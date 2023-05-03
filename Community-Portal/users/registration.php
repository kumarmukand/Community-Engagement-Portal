<?php
$msg ="";
include('includes/config.php');
error_reporting(0);
require 'phpmailer/PHPMailerAutoload.php';
if(isset($_POST['submit']))
{
	$fullname=$_POST['fullname'];
	$email=$_POST['email'];
	$password=md5($_POST['password']);
	$contactno=$_POST['contactno'];
		$CNIC=$_POST['CNIC'];
    $Gender=$_POST['Gender'];

	$status=1;
	$query=mysqli_query($con,"insert into users(fullName,userEmail,password,contactNo,CNIC,Gender,status) values('$fullname','$email','$password','$contactno','$CNIC','$Gender','$status')");

	$msg="Registration successfull. Now You can login !";
if(isset($_POST['submit']))
{
function sendemail($to,$from,$fromName,$body)
{
	$mail = new PHPMailer();
	$contactno=$_POST['contactno'];

$username = "923496444203";///Your Username
$password = "3918";///Your Password
$mobile = "92".$contactno;///Recepient Mobile Number
$sender = "SenderID";
$message = "Test SMS From EZPortal.com";


////sending sms

$post = "sender=".urlencode($sender)."&mobile=".urlencode($mobile)."&message=".urlencode($message)."";
$url = "https://sendpk.com/api/sms.php?username=923496444203&password=3918&sender=NPP&mobile=923496444203&message=RegSMS";
$ch = curl_init();
$timeout = 30; // set to zero for no timeout
curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)');
curl_setopt($ch, CURLOPT_URL,$url);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS,$post);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
$result = curl_exec($ch); 
/*Print Responce*/
echo $result;





$mail->Host = "smtp.gmail.com";

    //enable SMTP
    $mail->isSMTP();

    //set authentication to true
    $mail->SMTPAuth = true;

	 //set type of protection
    $mail->SMTPSecure = "TLS"; //or we can use TLS

    //set a port
    $mail->Port = 587; //or 587 if TLS

	  //set HTML to true

    //set login details for Gmail account
  
			$mail->setFrom($from, $fromName);
			$mail->addAddress($to);
			$mail->Subject = 'Welcome  to EZ Portal';
			$mail->Body = $body;
			$mail->Username = "nirmalparwani96@gmail.com";
    		$mail->Password = "npp96gmail1997";
    		$mail->isHTML(true);

			return $mail->send();
		}
		$email = $_POST['email'];

		if (sendemail($email, 'nirmalparwani96@gmail.com', 'EZ Complaint Confirm', 'Thankyou')) {
				$msg = 'Email sent!';
		}

  
  
}
}







?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>CMS | User Registration</title>
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
    	<script>
function userAvailability() {
$("#loaderIcon").show();
jQuery.ajax({
url: "check_availability.php",
data:'email='+$("#email").val(),
type: "POST",
success:function(data){
$("#user-availability-status1").html(data);
$("#loaderIcon").hide();
},
error:function (){}
});
}
</script>
  </head>

  <body>
	  <div id="login-page">
	  	<div class="container">
	  	
		      <form class="form-login" method="post">
		        <h2 class="form-login-heading">User Registration</h2>
		        <p style="padding-left: 1%; color: green">
		        	<?php if($msg){
echo htmlentities($msg);
		        		}?>


		        </p>
		        <div class="login-wrap">
		         <input type="text" class="form-control" placeholder="Full Name" name="fullname" required="required" autofocus>
		            <br>
		            <input type="email" class="form-control" placeholder="Email id" id="email" onBlur="userAvailability()" name="email" required="required">
		             <span id="user-availability-status1" style="font-size:12px;"></span>
		            <br>
		            <input type="password" class="form-control" placeholder="Password" required="required" name="password"><br >
		             <input type="tel" class="form-control" minlength="10" maxlength="10" name="contactno" placeholder="Contact no" required="required" autofocus>
		            <br>
		            
		            <input type="tel" class="form-control cnic"   minlength="10" maxlength="15" name="CNIC" placeholder="CNIC" required="required" autofocus>
		            		            <br>



		            		            Gender:
  <input type="radio" name="Gender"  placeholder="Gender"  required="required" autofocus value="female">Female
  <input type="radio" name="Gender"  placeholder="Gender"  required="required" autofocus value="male">Male
  <input type="radio"name="Gender"  placeholder="Gender"  required="required" autofocus value="other">Other
  <br><br>
 
          
                          <br>

		            <button class="btn btn-theme btn-block"  type="submit" name="submit" id="submit"><i class="fa fa-user"></i> Register</button>
		            <hr>
		            
		            <div class="registration">
		                Already Registered<br/>
		                <a class="" href="index.php">
		                   Sign in
		                </a>
		            </div>
		
		        </div>
		
		      
		
		      </form>	  	
	  	
	  	</div>
	  </div>

    <!-- js placed at the end of the document so the pages load faster -->
    
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <!--BACKSTRETCH-->
    <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
    <script type="text/javascript" src="assets/js/jquery.backstretch.min.js"></script>
    <script>
        $.backstretch("assets/img/login-bg.jpg", {speed: 500});
    </script>
<script>

$('.cnic').keydown(function(){

  //allow  backspace, tab, ctrl+A, escape, carriage return
  if (event.keyCode == 8 || event.keyCode == 9 
                    || event.keyCode == 27 || event.keyCode == 13 
                    || (event.keyCode == 65 && event.ctrlKey === true) )
                        return;
  if((event.keyCode < 48 || event.keyCode > 57))
   event.preventDefault();

  var length = $(this).val().length; 
              
  if(length == 5 || length == 13)
   $(this).val($(this).val()+'-');

 });    </script>

  </body>
</html>
