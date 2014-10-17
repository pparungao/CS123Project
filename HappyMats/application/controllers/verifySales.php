<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class VerifySales extends CI_controller{

	function __construct(){
		
		parent::__construct();
		$this->load->model('model_product','',TRUE);
		
	}

	function index(){

		$this->load->helper(array('form', 'url'));

		$this->load->library('form_validation');

		// this will index will contain the validation method
		$this->form_validation->set_rules('inputSalesDescription', 'Sales Description', 'trim|required');
		$this->form_validation->set_rules('inputSalesLocation', 'Sales Location', 'trim|required');


		if($this->form_validation->run() == FALSE){
			$this->load->view('templates/headerDashboard');
			$this->load->view('pages/registerSales');
		}else{
			$data=array(
				'Location'=>$_POST['inputSalesLocation'],
				'description'=>$_POST['inputSalesDescription'],
				'user_id'=>$_POST['userid']);
			$this->model_product->saveProductSales($data);
			$data['tests'] = $this->model_product->getProducts();
			$data['option'] = $this->model_product->getProductOptions();
			$data['sale'] = $this->model_product->getSales();
			$data['salesproducts'] = $this->model_product->getSalesProducts();

			$this->load->view('templates/headerDashboard');
			$this->load->view('pages/registerInitialSales',$data);
		}
	}


}