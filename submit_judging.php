<?php 
error_reporting(0);
include('header2.php');
include('session.php');

$contestant_name = $_POST['contestant_name'];
$contestant_id   = $_POST['contestant_id'];
$judge_id        = $_POST['judge_id'];
$judge_ctr       = $_POST['judge_ctr'];
$mainevent_id    = $_POST['mainevent_id'];   
$subevent_id     = $_POST['subevent_id'];
$jcomment        = $_POST['jcomment'];   

$conn->query("UPDATE sub_results SET judge_rank_stat='' WHERE subevent_id='$subevent_id' AND judge_id='$judge_id'");

// Kunin lahat ng criteria inputs
$criteria_scores = [];
$total_score = 0;

// Loop sa lahat ng cp1 hanggang cp15 na galing sa form
for ($i = 1; $i <= 15; $i++) {
    if (isset($_POST["cp$i"])) {
        $criteria_scores["criteria_ctr$i"] = $_POST["cp$i"];
        $total_score += $_POST["cp$i"];
    }
}

// Bumuo ng dynamic na SQL query
$criteria_columns = implode(",", array_keys($criteria_scores));
$criteria_values = implode("','", array_values($criteria_scores));

$conn->query("INSERT INTO sub_results (mainevent_id, subevent_id, contestant_id, judge_id, total_score, $criteria_columns, comments)
VALUES ('$mainevent_id', '$subevent_id', '$contestant_id', '$judge_id', '$total_score', '$criteria_values', '$jcomment')");

// I-update ang status ng contestant
$conn->query("UPDATE contestants SET status='finish' WHERE contestant_id='$contestant_id'");

?>
<script>
window.location = 'judge_panel.php?judge_ctr=<?php echo $judge_ctr; ?>&subevent_id=<?php echo $subevent_id; ?>&contestant_id=<?php echo $contestant_id; ?>';
alert('Score for <?php echo $contestant_name; ?> sent to Event Tabulators. Thank You!');						
</script>
