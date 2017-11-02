<?php
class Barang extends CI_Controller{
    
    function __construct() {
        parent::__construct();
        $this->load->model('model_barang');
        chek_session();
    }


    function index()
    {
        $data['record'] = $this->model_barang->tampil_data();
        $this->template->load('template','barang/lihat_data',$data);
    }
    
    function post()
    {
        if(isset($_POST['submit'])){
            // proses barang
            $nama       =   $this->input->post('nama_barang');
            $kategori   =   $this->input->post('kategori');
            $harga      =   $this->input->post('harga');
            $qty        =   $this->input->post('qty');
            $data       = array('nama_barang'=>$nama,
                                'kategori_id'=>$kategori,
                                'harga'=>$harga,
                                'qty'=>$qty);
            $this->model_barang->post($data);
            redirect('barang');
        }
        else{
            $this->load->model('model_kategori');
            $data['kategori']=  $this->model_kategori->tampilkan_data()->result();
            //$this->load->view('barang/form_input',$data);
            $this->template->load('template','barang/form_input',$data);
        }
    }
    
    
    function edit()
    {
       if(isset($_POST['submit'])){
            // proses barang
            $id         =   $this->input->post('id');
            $nama       =   $this->input->post('nama_barang');
            $kategori   =   $this->input->post('kategori');
            $harga      =   $this->input->post('harga');
            $qty        =   $this->input->post('qty');
            $data       = array('nama_barang'=>$nama,
                                'kategori_id'=>$kategori,
                                'harga'=>$harga,
                                'qty'=>$qty);
            $this->model_barang->edit($data,$id);
            redirect('barang');
        }
        else{
            $id=  $this->uri->segment(3);
            $this->load->model('model_kategori');
            $data['kategori']   =  $this->model_kategori->tampilkan_data()->result();
            $data['record']     =  $this->model_barang->get_one($id)->row_array();
            //$this->load->view('barang/form_edit',$data);
            $this->template->load('template','barang/form_edit',$data);
        }
    }
    
    
    function delete()
    {
        $id=  $this->uri->segment(3);
        $this->model_barang->delete($id);
        redirect('barang');
    }
    function masuk()
    {
        if(isset($_POST['submit'])){
            $barang_id  = $this->input->post('barang_id');
            $qty        = $this->input->post('qty');
            $data       = array('barang_id'=>$barang_id,
                                'qty'=>$qty);
            $this->model_barang->masuk($data);
            redirect('barang');
        }
        else{
            $this->template->load('template','barang/masuk_barang');
        }
    }
}