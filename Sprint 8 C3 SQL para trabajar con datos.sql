{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "SELECT\n",
    "    name,\n",
    "    price,\n",
    "    name_store,\n",
    "    date_upd\n",
    "FROM\n",
    "    products_data_all\n",
    "WHERE\n",
    "    category = 'milk'\n",
    "    AND date_upd = '2019-06-"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "SELECT\n",
    "    name,\n",
    "    price,\n",
    "    name_store,\n",
    "    date_upd\n",
    "FROM\n",
    "    products_data_all\n",
    "WHERE\n",
    "    category = 'milk'\n",
    "    AND date_upd IN ('2019-06-08','2019-06-15','2019-06-22',\n",
    "    '2019-06-29');"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "SELECT\n",
    "    *\n",
    "FROM\n",
    "    transactions\n",
    "WHERE\n",
    "    date >= '2019-06-01'\n",
    "    AND date < '2019-06-02'\n",
    "    AND id_product IN (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,\n",
    "13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25,\n",
    "26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38,\n",
    "39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51,\n",
    "52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64,\n",
    "65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77,\n",
    "78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90,\n",
    "91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103,\n",
    "104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116,\n",
    "117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129,\n",
    "130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142,\n",
    "143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155,\n",
    "156, 157, 158, 159, 160, 161);"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "base",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.12.7"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 2
}
