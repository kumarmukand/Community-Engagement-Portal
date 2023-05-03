<?php
session_start();
include('include/config.php');
require 'phpmailer/PHPMailerAutoload.php';
$email1 = "";
if(strlen($_SESSION['alogin'])==0)
  { 
header('location:index.php');
}
else {
  if(isset($_POST['update']))
  {
$complaintnumber=$_GET['cid'];
$status=$_POST['status'];
$remark=$_POST['remark'];
$query=mysqli_query($con,"insert into complaintremark(complaintNumber,status,remark) values('$complaintnumber','$status','$remark')");
$sql=mysqli_query($con,"update tblcomplaints set status='$status' where complaintNumber='$complaintnumber'");
$query=mysqli_query($con,"select categoryEmail,id from category WHERE category.categoryEmail IS NOT NULL &&  category.id IN (SELECT t.category FROM tblcomplaints t JOIN category c on t.category= c.id &&  t.complaintNumber='".$complaintnumber."')");
    $result = $query;
    $row = $result->fetch_assoc();
    $email =  $row["categoryEmail"];
//echo $email;
$query1=mysqli_query($con,"select fullName,userEmail from users WHERE users.userEmail IS NOT NULL && users.id IN (SELECT t.userId FROM tblcomplaints t JOIN category c on t.category= c.id && t.complaintNumber='".$complaintnumber."')");
    $result1 = $query1;
    $row1 = $result1->fetch_assoc();
    $email1 = $row1["fullName"];
    //echo $email1;
$query2=mysqli_query($con,"select complaintDetails from tblcomplaints , category c WHERE tblcomplaints.complaintDetails IS NOT NULL && tblcomplaints.category = c.id && tblcomplaints.complaintNumber='$complaintnumber'");
    $result2 = $query2;
    $row2 = $result2->fetch_assoc();
    $email2 = $row2["complaintDetails"];
    //echo $email2;









echo "<script>alert('Complaint details updated successfully');</script>";

if(isset($_POST['update']))
{
function sendemail($to,$from,$fromName,$body,$em)
{
  $mail = new PHPMailer();
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
      $mail->Subject = "New Complain from $em";
      $mail->Body = $body;
      $mail->Username = "nirmalparwani96@gmail.com";
        $mail->Password = "npp96gmail1997";
        $mail->isHTML(true);

      return $mail->send();
    }
    //$email = $_POST['email'];

    if (sendemail($email, 'nirmalparwani96@gmail.com', "Complain Details", "Complain Details are $email2",$email1)) {
        $msg = 'Email sent!';
        //echo $msg;
    }


  
  
}



















  }

 ?>
<script language="javascript" type="text/javascript">
function f2()
{
window.close();
}ser
function f3()
{
window.print(); 
}
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>User Profile</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<link href="anuj.css" rel="stylesheet" type="text/css">
</head>
<body>

<div style="margin-left:50px;">
 <form name="updateticket" id="updatecomplaint" method="post"> 
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td  >&nbsp;</td>
      <td >&nbsp;</td>
    </tr>
    <tr height="50">
      <td><b>Complaint Number</b></td>
      <td><?php echo htmlentities($_GET['cid']); ?></td>
    </tr>
    <tr height="50">
      <td><b>Status</b></td>
      <td><select name="status" required="required">
      <option value="">Select Status</option>
      <option value="in process">In Process</option>
    <option value="closed">Closed</option>
        
      </select></td>
    </tr>


      <tr height="50">
      <td><b>Remark</b></td>
      <td><textarea name="remark" cols="50" rows="10" required="required"></textarea></td>
    </tr>
    


        <tr height="50">
      <td>&nbsp;</td>
      <td><input type="submit" name="update" value="Submit"></td>
    </tr>



       <tr><td colspan="2">&nbsp;</td></tr>
    
    <tr>
  <td></td>
      <td >   
      <input name="Submit2" type="submit" class="txtbox4" value="Close this window " onClick="return f2();" style="cursor: pointer;"  /></td>
    </tr>
   

 
</table>
 </form>
</div>

</body>
</html>

     <?php } ?>