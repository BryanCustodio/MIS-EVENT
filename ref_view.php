<!DOCTYPE html>
<html lang="en">
   
   <?php
   include('header.php');
   include('session.php');
   ?>

  <body data-spy="scroll" data-target=".bs-docs-sidebar">
 
  <div class="container">
    <div class="row">
      <div class="span12">

        <?php   
        $s_event_query = $conn->query("SELECT * FROM sub_event WHERE view='activated'") or die($conn->error);
        while ($s_event_row = $s_event_query->fetch()) {
            $active_sub_event = $s_event_row['subevent_id'];
            $active_main_event = $s_event_row['mainevent_id'];
            
            $event_query = $conn->query("SELECT * FROM main_event WHERE mainevent_id='$active_main_event'") or die($conn->error);
            while ($event_row = $event_query->fetch()) { 
        ?>
        
        <center>
            <?php include('doc_header.php'); ?>
             
            <table>
                <tr><td align="center"><h2><?php echo $event_row['event_name']; ?></h2></td></tr>
                <tr><td align="center"><h3>Live View of Result - <?php echo $s_event_row['event_name']; ?></h3></td></tr>
            </table>
        </center>

        <!-- Fetch and Sort Contestants by Average Score -->
        <?php
        $contestants = [];

        $o_result_query = $conn->query("SELECT DISTINCT contestant_id FROM sub_results WHERE mainevent_id='$active_main_event' AND subevent_id='$active_sub_event'") or die($conn->error);
        while ($o_result_row = $o_result_query->fetch()) {
            $contestant_id = $o_result_row['contestant_id'];

            // Fetch contestant name
            $cname_query = $conn->query("SELECT * FROM contestants WHERE contestant_id='$contestant_id'") or die($conn->error);
            $cname_row = $cname_query->fetch();

            // Calculate total and average score
            $total_score = 0;
            $num_judges = 0;

            $tot_score_query = $conn->query("SELECT total_score FROM sub_results WHERE contestant_id='$contestant_id'") or die($conn->error);
            while ($tot_score_row = $tot_score_query->fetch()) {
                $total_score += $tot_score_row['total_score'];
                $num_judges++;
            }

            $average_score = ($num_judges > 0) ? round($total_score / $num_judges, 2) : 0;

            // Store contestant data
            $contestants[] = [
                'id' => $contestant_id,
                'name' => $cname_row['fullname'],
                'average' => $average_score
            ];
        }

        // Sort contestants by highest average score
        usort($contestants, function ($a, $b) {
            return $b['average'] <=> $a['average'];
        });

        // Display the Top 5 Contestants
        echo "<h3>Top 5 Contestants</h3>";
        echo "<table class='table table-bordered'>";
        echo "<tr><th>Rank</th><th>Contestant</th><th>Average Score</th></tr>";

        for ($i = 0; $i < min(5, count($contestants)); $i++) {
            echo "<tr>";
            echo "<td>" . ($i + 1) . "</td>";
            echo "<td>" . $contestants[$i]['name'] . "</td>";
            echo "<td>" . $contestants[$i]['average'] . "</td>";
            echo "</tr>";
        }

        echo "</table>";

        // Display Each Contestant's Detailed Score Breakdown
        foreach ($contestants as $index => $contestant) {
        ?>
        <div class="col-lg-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title"><?php echo ($index + 1) . ". " . $contestant['name']; ?></h3>
                </div>
                <div class="panel-body">
                    <table class="table table-bordered">
                        <tr><th>Judge</th><th>Score</th></tr>

                        <?php
                        $tot_score_query = $conn->query("SELECT judge_id, total_score FROM sub_results WHERE contestant_id='{$contestant['id']}'") or die($conn->error);
                        while ($tot_score_row = $tot_score_query->fetch()) {
                            $judge_idzz = $tot_score_row['judge_id'];
                            $judge_query = $conn->query("SELECT * FROM judges WHERE judge_id='$judge_idzz'") or die($conn->error);
                            $judge_row = $judge_query->fetch();
                            echo "<tr>";
                            echo "<td>" . $judge_row['fullname'] . "</td>";
                            echo "<td>" . $tot_score_row['total_score'] . "</td>";
                            echo "</tr>";
                        }
                        ?>

                        <tr>
                            <td><b>Average:</b></td>
                            <td><b><?php echo $contestant['average']; ?></b></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <?php } } } ?>
       
    </div>
  </div>

    <?php include('footer.php'); ?>

    <!-- JavaScript Libraries -->
    <script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.js"></script>

  </body>
</html>
