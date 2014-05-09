<h2>Users</h2>

<!-- link to add new users page -->
<div class='upper-right-opt'>
    <?php echo $this->Form->create('User');?>
    <label>Candidato: </label><?php echo $this->Form->select('candidates',$candidates)?>
    <label>Lista: </label><?php echo $this->Form->select('list_options',array('1' => 'Leads', '2' => 'Pledges', '3' => 'Donor match'));?>
    <?php echo $this->Form->submit('submit');?>
</div>

<?php 
    $type_user = 'User';
    if(isset($users[0]['Donor']))
        $type_user = 'Donor';
?>

<table style='padding:5px;'>
    <tr style='background-color:#fff;'>
        <th>ID</th>
        <th>Name</th>
        <th>Telephone</th>
        <?php if($type_user == 'Donor'){?>
            <th>donacion minima</th>
            <th>donacion maxima</th>
            <th>donacion promedio</th>
        <?php } ?>    
    </tr>
    
<?php
    foreach( $users as $user ){
        echo "<tr>";
        echo "<td>{$user["$type_user"]['id']}</td>";
        echo "<td>{$user["$type_user"]['name']}</td>";
        echo "<td>{$user["$type_user"]['telephone']}</td>";
        if($type_user == 'Donor'){
            echo "<td>{$user[0]['minimo']}</td>";
            echo "<td>{$user[0]['maximo']}</td>";
            echo "<td>{$user[0]['promedio']}</td>";
        }
        echo "</td>";
        echo "</tr>";
    }
?>
</table>