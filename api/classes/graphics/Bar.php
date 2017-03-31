<?php

class Bar {
  public function generate($data) {
    if (isset($data['country_ids']) && is_array($data['country_ids']) && count($data['country_ids']) > 1) {
      $handle = new BarMultiple();
      return $handle->generate($data);
    }

    $handle = new BarSingle();
    return $handle->generate($data);
  }

}
