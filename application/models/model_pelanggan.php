<?php
class model_pelanggan extends ci_model{
    
    
    function tampil_data()
    {
        $query= "SELECT * FROM pelanggan";
        return $this->db->query($query);
    }
    
    function post($data)
    {
        $this->db->insert('pelanggan',$data);
    }
}