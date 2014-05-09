<?php
class UsersController extends AppController{

	var $uses = array('Candidate', 'User', 'Donor');
    
    public function index() {
    	$this->set('candidates', $this->Candidate->find('list', array('fields' => array('id', 'name'))));

        $this->getUsers($this->request['data']['User']['candidates'], $this->request['data']['User']['list_options']);
    }

    public function getUsers($candidate, $list){
    	if($list == '1'){
    		$this->set('users', $this->User->find('all', array('conditions' => "user_contact = 1 and id_user = $candidate")));
    	}elseif($list == '2'){
    		$this->set('users', $this->User->find('all', array('conditions' => "pledge = 1 and id_user = $candidate")));
    	}elseif($list == '3'){
    		$candidate = $this->Candidate->find('all', array('fields' => 'id_political_party, id_ocupation, id_location', 'conditions' => "id = $candidate"));
    		$political_party = $candidate[0]['Candidate']['id_political_party'];
    		$ocupation = $candidate[0]['Candidate']['id_ocupation'];
    		$location = $candidate[0]['Candidate']['id_location'];
    		$this->set('users', $this->Donor->find('all', array('fields' => '*, (select AVG(amount) from contributions where id_donor = Donor.id) as promedio,
    																			(select MAX(amount) from contributions where id_donor = Donor.id) as maximo,
																				(select MIN(amount) from contributions where id_donor = Donor.id) as minimo',
    															'conditions' => "(id_political_party = $political_party AND id_ocupation = $ocupation AND id_location = $location) 
    																			OR (id_ocupation = $ocupation AND id_location = $location)
    																			OR (id_location = $location)"
    															)
    											   )
    				  );
    	}
    }
}

?>