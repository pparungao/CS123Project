<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class VerifyInitialSale extends CI_controller{

	function __construct(){
		
		parent::__construct();
		$this->load->model('model_product','',TRUE);
		
	}

	function index(){

		$this->load->helper(array('form', 'url'));

		$this->load->library('form_validation');

		// this will index will contain the validation method
		$this->form_validation->set_rules('inputSalesQuantity', 'Sales Quantity', 'trim|required');
		$this->form_validation->set_rules('inputSalesPrice', 'Sales Price', 'trim|required');


		if($this->form_validation->run() == FALSE){
			$this->load->view('templates/headerDashboard');
			$this->load->view('pages/registerInitialSales');
		}else{
			$data=array(
				'quantity'=>$_POST['inputSalesQuantity'],
				'Price'=>$_POST['inputSalesPrice'],
				'sales_id'=>$_POST['sales'],
				'record_id'=>$_POST['records']);
			$this->model_product->saveSalesProducts($data);

			$data['sale'] = $this->model_product->getSales();
			$this->load->view('templates/headerDashboard');
			$this->load->view('pages/viewSales',$data);
		}
	}


}