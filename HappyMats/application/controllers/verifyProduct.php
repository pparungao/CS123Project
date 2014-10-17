<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class VerifyProduct extends CI_controller{

	function __construct(){
		
		parent::__construct();
		$this->load->model('model_product','',TRUE);
		
	}

	function index(){

		$this->load->helper(array('form', 'url'));

		$this->load->library('form_validation');

		// this will index will contain the validation method
		$this->form_validation->set_rules('inputProductName', 'Product Name', 'trim|required');
		$this->form_validation->set_rules('inputProductDesc', 'Product Description', 'trim|required');
		$this->form_validation->set_rules('inputProductQuantity', 'Product Quantity', 'trim|required');
		$this->form_validation->set_rules('inputProductPrice', 'Product Price', 'trim|required');


		if($this->form_validation->run() == FALSE){
			//Field validation failed. User will be redirected to the login page

			$this->load->view('templates/headerDashboard');
			$this->load->view('pages/registerProduct');


		}else{
			//Insert product details
			$data=array(
				'Name'=>$_POST['inputProductName'],
				'Description'=>$_POST['inputProductDesc'],
				'Quantity'=> $_POST['inputProductQuantity'],
				'Price'=>$_POST['inputProductPrice']);
			$this->model_product->saveProductDetails($data);
			$data['tests'] = $this->model_product->getProducts();
			$this->load->view('templates/headerDashboard');
			$this->load->view('pages/viewProduct', $data);
		}

	}


}