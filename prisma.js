const { PrismaClient } = require('@prisma/client')

const prisma = new PrismaClient()

// query database example
const main = async () => {
    const allCustomers = await prisma.customer.findMany()
    console.log(allCustomers)
}

main()
