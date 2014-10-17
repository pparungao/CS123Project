<?php

class Pages extends CI_Controller {

	public function view($page = 'dashboard')
	{
		if ( ! file_exists(APPPATH.'/views/pages/'.$page.'.php'))
		{
			// Whoops, we don't have a page for that!
			show_404();
		}
		$this->load->model('model_product');
		$data['tests'] = $this->model_product->getProducts();
		$data['option'] = $this->model_product->getProductOptions();
		$data['sale'] = $this->model_product->getSales();
		$data['salesproducts'] = $this->model_product->getSalesProducts();
		$data['title'] = ucfirst($page); 


		$this->load->view('templates/headerDashboard');
		$this->load->view('pages/'.$page, $data);


		

	}
}
