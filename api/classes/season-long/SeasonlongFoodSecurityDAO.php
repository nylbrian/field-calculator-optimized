<?php

class SeasonlongFoodSecurityDAO {
  const MAIN_TABLE = 'season_long_food_security';

  public function checkRecordExists($seasonLongId) {
    $result = DB::queryMaster('SELECT id from '.self::MAIN_TABLE.' WHERE season_long_id = %d', array($seasonLongId));
    return $result->fetchFirstRow();
  }

  public function insert($data, $seasonLongId) {
    $checkId = $this->checkRecordExists($seasonLongId);
    if ($checkId) {
      $data['id'] = $checkId['id'];
    }

    if (isset($data['id'])) {
      return $this->update($data['id'], $data, $seasonLongId);
    }

    DB::startTransaction();

    $sql = 'INSERT INTO `' . self::MAIN_TABLE . '`
      (`season_long_id`, `rice_amount_wet_season`,
        `rice_amount_dry_season`, `amount_unmilled_rice_wet_season`, `amount_unmilled_rice_dry_season`,
        `price_rice_sold_wet_season`, `price_rice_sold_dry_season`, `purchased_rice`,
        `amount_milled_rice`, `amount_unmilled_rice`, `price_per_kg_milled_rice`,
        `price_per_kg_unmilled_rice`, `members_below_12_years_old`, `members_above_12_years_old`)
      VALUES
      (%d, %d, %d,
        %d, %d, %d,
        %d, %d, %d,
        %d, %d, %d,
        %d, %d)';

    $params = array(
      $seasonLongId,
      $data['rice_amount_wet_season'],
      $data['rice_amount_dry_season'],
      $data['amount_unmilled_rice_wet_season'],
      $data['amount_unmilled_rice_dry_season'],
      $data['price_rice_sold_wet_season'],
      $data['price_rice_sold_dry_season'],
      $data['purchased_rice'],
      $data['amount_milled_rice'],
      $data['amount_unmilled_rice'],
      $data['price_per_kg_milled_rice'],
      $data['price_per_kg_unmilled_rice'],
      $data['members_below_12_years_old'],
      $data['members_above_12_years_old']
    );

    $result = DB::queryMaster($sql, $params);
    $id = $result->insertId();

    if (!$id) {
      DB::rollback();
      throw new SeasonlongDAOException('Failed to insert food security information');
    }

    DB::commit();
    $data['id'] = $id;
    return $data;
  }

  public function get($seasonLongId) {
    $result = DB::querySlave('
      SELECT * FROM `' . self::MAIN_TABLE . '` WHERE season_long_id = %d', array($seasonLongId));

    if ($result->numRows() <= 0) {
      return false;
    }

    $data = $result->fetchFirstRow();
    return $data;
  }

  public function update($id, $data, $seasonLongId) {
    DB::startTransaction();

    DB::queryMaster('UPDATE `' . self::MAIN_TABLE . '`
      SET `season_long_id` = %d, `rice_amount_wet_season` = %d,
        `rice_amount_dry_season` = %d, `amount_unmilled_rice_wet_season` = %d, `amount_unmilled_rice_dry_season` = %d,
        `price_rice_sold_wet_season` = %d, `price_rice_sold_dry_season` = %d, `purchased_rice` = %d,
        `amount_milled_rice` = %d, `amount_unmilled_rice` = %d, `price_per_kg_milled_rice` = %d,
        `price_per_kg_unmilled_rice` = %d, `members_below_12_years_old` = %d, `members_above_12_years_old` = %d
      WHERE id = %d',
      array(
        $seasonLongId,
        $data['rice_amount_wet_season'],
        $data['rice_amount_dry_season'],
        $data['amount_unmilled_rice_wet_season'],
        $data['amount_unmilled_rice_dry_season'],
        $data['price_rice_sold_wet_season'],
        $data['price_rice_sold_dry_season'],
        $data['purchased_rice'],
        $data['amount_milled_rice'],
        $data['amount_unmilled_rice'],
        $data['price_per_kg_milled_rice'],
        $data['price_per_kg_unmilled_rice'],
        $data['members_below_12_years_old'],
        $data['members_above_12_years_old'],
        $id,
      ));

    DB::commit();
    return $data;
  }
}
