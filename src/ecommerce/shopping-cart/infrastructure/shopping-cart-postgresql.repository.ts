import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { DatabaseService } from 'src/database/database.service';
import { ShoppingCartRepository } from '../domain/shopping-cart.repository';

@Injectable()
export class ShoppingCartPostgreSQL implements ShoppingCartRepository {
  public constructor(private readonly databaseService: DatabaseService) {}

  public async addProduct(productId: string, cartId: string, quantity: number) {
    const table = await this.databaseService.executeQuery(
      'INSERT INTO products_shopping_carts(product_id, cart_id, quantity) VALUES($1, $2, $3) RETURNING *',
      [productId, cartId, quantity],
    );
  }

  public async updateQuantityPerProduct(cartId: string, quantity: number) {
    const cartIdDb = await this.databaseService.executeQuery(
      'SELECT cart_id FROM shopping_carts WHERE cart_id = $1',
      [cartId],
    );
    console.log('SHOPPING CART', cartIdDb);
    if (cartIdDb.length < 1) {
      throw new HttpException(
        `cart with id ${cartId} does not exist`,
        HttpStatus.BAD_REQUEST,
      );
    }
    const shoppingCartUpdated = await this.databaseService.executeQuery(
      'UPDATE products_shopping_carts SET quantity=$1 WHERE cart_id=$2 RETURNING *',
      [quantity, cartId],
    );
  }

  public async deleteProduct(productId: string, cartId: string) {
    const productDb = await this.databaseService.executeQuery(
      'SELECT * FROM products_shopping_carts WHERE cart_id=$1 AND product_id=$2',
      [cartId, productId],
    );
    if (productDb.length < 1) {
      throw new HttpException(
        `there is no product with id ${cartId} in cart with id ${productId}`,
        HttpStatus.BAD_REQUEST,
      );
    }
    await this.databaseService.executeQuery(
      'DELETE FROM products_shopping_carts WHERE cart_id=$1 AND product_id=$2',
      [cartId, productId],
    );
  }
}