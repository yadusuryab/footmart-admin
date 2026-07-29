// app/admin/layout.tsx
import { cookies } from 'next/headers'
import { redirect } from 'next/navigation'


async function checkAuth() {
  const token = (await cookies()).get('admin_token')?.value
  
  if (!token) {
    return false
  }

  try {
    const response = await fetch(`${process.env.NEXT_PUBLIC_APP_URL}/api/auth/verify`, {
      headers: {
        Cookie: `admin_token=${token}`,
      },
    })
    
    return response.ok
  } catch {
    return false
  }
}

export default async function AdminLayout({
  children,
}: {
  children: React.ReactNode
}) {
  const isAuthenticated = await checkAuth()

  if (!isAuthenticated) {
    redirect('/login')
  }

  return (
    <div className="min-h-screen ">
      <div className="flex">
        <main className="flex-1 ">
          <div className=" mx-auto">
            {children}
          </div>
        </main>
      </div>
    </div>
  )
}