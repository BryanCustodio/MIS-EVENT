<?php 
  error_reporting(0);
  include('header2.php');
  include('session.php');

  $contestant_name = $_POST['contestant_name'];
  $contestant_id = $_POST['contestant_id'];
  $judge_id = $_POST['judge_id'];
  $judge_ctr = $_POST['judge_ctr'];
  $subevent_id = $_POST['subevent_id'];
  $jcomment = $_POST['jcomment'];

  $conn->query("UPDATE sub_results SET judge_rank_stat='' WHERE subevent_id='$subevent_id' AND judge_id='$judge_id'");

  // Getting scores from form
  $cp1 = $_POST['cp1'];
  $cp2 = $_POST['cp2'];
  $cp3 = $_POST['cp3'];
  $cp4 = $_POST['cp4'];
  $cp5 = $_POST['cp5'];
  $cp6 = $_POST['cp6'];
  $cp7 = $_POST['cp7'];
  $cp8 = $_POST['cp8'];
  $cp9 = $_POST['cp9'];
  $cp10 = $_POST['cp10'];
  
  // Calculating total score
  $total_score = $cp1 + $cp2 + $cp3 + $cp4 + $cp5 + $cp6 + $cp7 + $cp8 + $cp9 + $cp10;

  // Updating sub_results table with 10 criteria
  $conn->query("UPDATE sub_results SET total_score='$total_score',
    criteria_ctr1='$cp1', criteria_ctr2='$cp2', criteria_ctr3='$cp3',
    criteria_ctr4='$cp4', criteria_ctr5='$cp5', criteria_ctr6='$cp6',
    criteria_ctr7='$cp7', criteria_ctr8='$cp8', criteria_ctr9='$cp9',
    criteria_ctr10='$cp10', comments='$jcomment' 
    WHERE contestant_id='$contestant_id' AND judge_id='$judge_id'");

  // Mark contestant as finished
  $conn->query("UPDATE contestants SET status='finish' WHERE contestant_id='$contestant_id'");
?>

<script>
  window.location = 'judge_panel.php?judge_ctr=<?php echo $judge_ctr; ?>&subevent_id=<?php echo $subevent_id; ?>&contestant_id=<?php echo $contestant_id; ?>&pStat=xChange';
  alert('Score for <?php echo $contestant_name; ?> sent to Event Tabulators. Thank You!');
</script>