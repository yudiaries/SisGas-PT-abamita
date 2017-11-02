<?php
class pelanggan extends ci_controller{
    
   function __construct() {
        parent::__construct();
        $this->load->model('model_pelanggan');
    }
    
    function index()
    {
        $data['record']=  $this->model_pelanggan->tampil_data();
        //$this->load->view('operator/lihat_data',$data);
        $this->template->load('template','pelanggan/lihat_pelanggan',$data);
    }
}